require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"
require "sinatra/content_for"
require "redcarpet"
require "yaml"
require "bcrypt"


#bcrypt encryption
class PasswordDigester
  BCrypt::Engine.cost = 12

  def self.encrypt(password)
    BCrypt::Password.create(password)
  end

  def self.check?(password, encrypted_password)
    BCrypt::Password.new(encrypted_password) == password
  end

end


# Enable Sessions
configure do
	enable :sessions
	set :session_secret, "secret"
end

# ROOT = File.expand_path("..", __FILE__)
def data_path
	if ENV["RACK_ENV"] == "test"
		File.expand_path("../test/data", __FILE__)
	else
		File.expand_path("../data", __FILE__)
	end
end

def users_path
	if ENV["RACK_ENV"] == "test"
		File.expand_path("../test/users", __FILE__)
	else
		File.expand_path("../users", __FILE__)
	end
end

#Find the next available highest index for a container onject
def next_index(container)
	num = @data.map {|hashe| hashe[:id] }.max || 0
	num + 1
end
def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
end

def delete_document(name)
	File.delete(File.join(data_path, name))
end

def render_markdown(content)
	markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
	# markdown.render(File.read(file_path))
	markdown.render(content)
end

def load_file_content(path)
	content = File.read(path)

	case File.extname(path)
	when ".txt"
		headers["Content-Type"] = "text/plain"
		content
	when ".md"
		render_markdown(content)
	end
end

def signed_in?
	session[:user] && session[:user] != ""
end

def admin?
	session[:user] == "admin"
end

def require_signed_in_user
	unless signed_in?
		session[:error] = "Login Required"
		redirect "/"
	end
end

def require_administrator_privilages
	unless admin?
		redirect "/"
	end
end



before do 
	@data = []
	@documents = Dir.glob(File.join(data_path,"*")).map do |document|
		File.basename(document)
	end
	# Put each document into a hash with a unique ID
	# And path name
	@documents.each do |document|
		i = next_index(@data)
		@data << {id: i, path: document}
	end
	session[:error] ||= ""
	@users = YAML.load_file("#{users_path}/users.yaml")
end


helpers do
	def admin?
		user = session[:user].to_sym if session[:user]
		@users[:admins].keys.include?(user)
	end
	def user?
		user = session[:user].to_sym if session[:user]
		@users[:users].keys.include?(user)
	end

	def yield_lines(string_with_newlines)
		if string_with_newlines
			lines = string_with_newlines.split("\n")
			lines.each { |line| yield(line)}
		else
			""
		end
	end 
end

# get the homepage
get "/" do
	erb :home, layout: :layout
end

# get "/:document_id" do |document_id|
# 	doc_data = @data.find { |doc_h| doc_h[:id] == document_id.to_i }
# 	path = doc_data[:path]
# 	@text = File.read("#{ROOT}/data/#{path}")
# 	@text_paragraphs = @text.split("\n")
# 	erb :document, layout: :layout
# end
get "/users/signin" do
	erb :signin, layout: :gateway
end

def complex_pass?(password)
	password.match?(/\W/) && password.match?(/\d/)
end

def verify_password(password)
	if password && password.length > 7 && complex_pass?(password)
		true
	else
		false
	end
end

def username_taken?(username)
	users = @users[:admins].keys + @users[:users].keys
	unverified_users = YAML.load_file("#{users_path}/new_users.yaml")
	if unverified_users
		unverified_users = unverified_users.keys
	else
		unverified_users = []
	end
	users = users + unverified_users
	# puts "username"
	# puts params[:username].inspect
	# puts username.inspect
	# puts "users"
	users.each {|user| puts user.inspect}
	if users.include?(username.to_sym)
		true
	else
		false
	end
end


post "/users/register" do

	if username_taken?(params[:username])
		session[:error] = "Username unavailable. Please try another."
		erb :signin, layout: :gateway
	elsif verify_password(params[:password])
		user_name = params[:username]
		user_pass = PasswordDigester.encrypt(params[:password])
		File.open(File.join(users_path, "new_users.yaml"), "a") do |line|
			line.puts "\r" + ":#{user_name}: " + user_pass 
		end
		session[:success] = "Account created successfully. \n "\
"You will be able to login once your account has been reviewed."
		redirect "/"
	else
		session[:error] = "Password should be at least 8 characters long and contain at least one special character and number"
		erb :signin, layout: :gateway
	end

end

get "/users/edit" do
	require_administrator_privilages
	@filename = "users.yaml"
	@path = File.join(users_path, @filename)
	@content = File.read(File.join(users_path, @filename))
	erb :edit, layout: :layout
end


def valid_login(username, password)
	username = username.to_sym || ""
	users = @users[:admins].merge(@users[:users])

	if users[username] && 
		PasswordDigester.check?(password, users[username])
		true
	# users[username] == password
	else
		false
	end
end

post "/users/signin" do
	username = params[:username]
	password = params[:password]
	if !valid_login(params[:username], params[:password])
		status 422
		session[:error] = "Invalid Username or Password."
		erb :signin, layout: :gateway
	else
		session[:success] = "Login successful."
		session[:user] = username
		redirect "/"
	end
	
end

post "/users/signout" do
	session[:user] = nil
	session[:success] = "Logged out successfully."
	redirect "/"
end

get "/new" do
	require_signed_in_user
	erb :new, layout: :layout
end

# get "/upload" do
# 	require_signed_in_user
# 	erb :upload, layout: :layout
# end

# post "/upload/image" do
# 	puts "length"
# 	puts params[:files]
# 	puts "end"
# 	erb :upload, layout: :layout
# end

def valid_title(title)
	if title == "" 
		false
	else
		true
	end

end

def unique_title?(title)
	if @documents.include?(title) || @documents.include?("#{title}.txt")
		false
	else
		true
	end
end
def process_title(title)
	if !title.include?(".")
		title = "#{title}.txt"
	else
		title
	end
end
post "/new" do
	require_signed_in_user
	title = params[:title] 
	@content = params[:content]
	if !valid_title(title)
		status 422
		session[:error] = "Must provide a valid title"
		erb :new
	elsif !unique_title?(title)
		status 422
		session[:error] = "Must provide a unique title"
		erb :new
	else
		create_document(process_title(title), @content)
		session[:success] = "File #{title} created."
		redirect "/"
	end
end

# load a file
get "/:filename" do |filename|
	@path = File.join(data_path, filename)
	@basename = File.basename(@path)
	puts "happy"
	puts @path
	if !File.file?(@path)
		session[:error] = "#{@basename} does not exist"
		redirect "/"
	else
		load_file_content(@path)
	end

end

# edit a document
get "/:filename/edit" do |filename|
	require_signed_in_user
	@filename = filename
	@path = File.join(data_path, filename)
	@content = File.read(File.join(data_path, @filename))
	erb :edit, layout: :layout
end
post "/:filename" do |filename|
	require_signed_in_user
	# file = File.new("#{ROOT}/data/#{filename}", "w")
	file_path = File.join(data_path, filename)
	File.write file_path, "#{params[:content]}"
	session[:success] = "The file has been updated."
	params[:return] = ""
	redirect("/")
end

post "/:filename/delete" do |filename|
	require_signed_in_user
	delete_document(filename)
	session[:success] = "file #{filename} deleted successfully"
	redirect "/"
end



# custom 404 page
# not_found do
# 	"ERROR 404 :( :( ERRRROOOOOORR"
# end

# DEPRECATED
#
# get "/*.md" do |file|
# 	@path = ROOT + "/data/" + file + ".md"
# 	render_markdown(@path)

# end

# get "/*.*" do |file, extension|

# 	@path = ROOT + "/data/" + file + "." + extension
# 	# if the file name is not in @data, redirect to home page
# 	# put an optional p in the home layout AND delete it after.

# 	# if !@documents.include?(File.basename @path)
# 	if !File.file?(@path)
# 		session[:error] = "#{File.basename(@path)} does not exist"
# 		redirect "/"
# 	else
# 		headers["Content-Type"] = "text/plain"
# 		# send_file "#{ROOT}/data/#{@path}"
# 		File.read(@path)
# 	end
# end








