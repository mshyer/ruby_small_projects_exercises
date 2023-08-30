ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"
require "fileutils"

require_relative "../cms"

# def create_document(name, content = "")
#     File.open(File.join(data_path, name), "w") do |file|
#       file.write(content)
#     end
# end



class AppTest < Minitest::Test
	include Rack::Test::Methods


	def app
		Sinatra::Application
	end

	def admin_session
  		{ "rack.session" => { user: "admin" } }
	end

	def non_admin_user_session
		{ "rack.session" => { user: "mikmik" } }
	end

	def session
		last_request.env["rack.session"]
	end

	def setup
		FileUtils.mkdir_p(users_path)
		File.open(File.join(users_path, "users.yaml"), "w") do |file|
		    file.write(
"---
:admins:
  :admin: $2a$12$9HPT.aCLNFjnK/HeMLSvgeq8CDBY8M5mTILlk/K6brHP12kX2lvJe
  :administrator: $2a$12$bUESzK1upsuCXUBJOK.Ql.FVy4/z/iyONVBYCMe3D9HlFsFV/Qczq
:users:
  :mikmik: $2a$12$mNQOTcwC6b.oofHS2DpPDO.2Jv.eWA4.jtmKfcDeiM0ZWwBbEJntW
  :pimento: $2a$12$WiuJzyWW5cgWt1dqDJNU..QhUdR27Um9fzG5Ld6czN9ZxsuuoHm4W
")
		end
				File.open(File.join(users_path, "new_users.yaml"), "w") do |file|
		    file.write(
"---
:mikmik: $2a$12$mNQOTcwC6b.oofHS2DpPDO.2Jv.eWA4.jtmKfcDeiM0ZWwBbEJntW
")
		end
		FileUtils.mkdir_p(data_path)
		create_document("/test1.txt", "This is some test text")
		create_document("/test2.txt", "This is some testy text")
		create_document("/test3.txt", "This is some of the best text")
		create_document("/markdown.md", "\#This is some of the best text")
	end

	def teardown
		FileUtils.rm_rf(data_path)
		FileUtils.rm_rf(users_path)
	end


	def test_index_ok
		get "/"
		assert_equal 200, last_response.status
		assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
	end

	def test_index_files_loaded

		get "/"
		filepaths = Dir.glob((File.join(data_path, "*")))
		puts filepaths
		body = last_response.body
		assert(filepaths.all?{|path| body.include?(File.basename(path))})
	end

	def test_viewing_plaintext_ok
		get "/test1.txt"
		assert_equal 200, last_response.status
		assert_equal "text/plain", last_response["Content-Type"]
	end

	def test_file_doesnt_exist
		get "/xyzxyz.xyzxyz"
		assert_equal 302, last_response.status
		path = data_path + "/xyzxyz.xyzxyz"
		refute File.file?(path)
		assert_equal "xyzxyz.xyzxyz does not exist", session[:error]
		get last_response["Location"]
		assert_equal 200, last_response.status
		get "/"
		refute_includes last_response.body, "xyzxyz.xyzxyz does not exist"

	end

	def test_plaintext_exact_match
		get "/test1.txt"
		orig_f = File.read(File.join(data_path, "test1.txt"))
		body = last_response.body
		assert_equal(body, orig_f)
	end


	def test_markdown_file
		get "/markdown.md"
		assert_equal 200, last_response.status
		assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
		assert_includes(last_response.body, "<h1>")
	end

	def test_post_file

		# These query parameters in url also work
		# post "/changes.txt?content=testing-testing-123"
		post "/test1.txt", {content: "testing-testing-123"}, admin_session
		assert_equal 302, last_response.status
		# get last_response["Location"]
		assert_includes session[:success], "has been updated"
		get "/test1.txt/edit"
		#test new file exists in layout
		assert_includes(last_response.body, "testing-testing-123")
	end
	def test_edit_file
		get "/test3.txt/edit", {}, admin_session
		assert_equal 200, last_response.status
		assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
		# test loading file correctly
		assert_includes(last_response.body, File.read(File.join(data_path, "test3.txt")))
	end

	def test_new_file
		get "/new", {}, admin_session
		assert_equal 200, last_response.status
		assert_includes(last_response.body, "New Document")
		post "/new", title: "ham_sandwich", content: "ham and cheese"
		assert_equal 302, last_response.status
		assert_includes session[:success], "created"
	end

	def test_new_file_error
		post "/new", {title: "", content: "ham and cheese"}, admin_session
		assert_equal 422, last_response.status
		assert_includes last_response.body, "valid"
		assert_includes last_response.body, "ham and cheese"
		post "/new", title: "ham_sandwich", content: "ham and cheese"
		assert_equal 302, last_response.status
		post "/new", title: "ham_sandwich", content: "ham and cheese"
		assert_equal 422, last_response.status
		assert_includes last_response.body, "ham and cheese"
		assert_includes last_response.body, "unique"
	end

	def test_delete_file
		get "/test1.txt", {}, admin_session
		assert_equal 200, last_response.status
		post "/test1.txt/delete"
		assert_equal 302, last_response.status
		get last_response["Location"]
		assert_includes last_response.body, "deleted"
		get "/test1.txt"
		assert_equal 302, last_response.status
		get last_response["Location"]
		assert_includes last_response.body, "does not exist"
	end

	def test_signin
		get "/users/signin"
		assert_equal 200, last_response.status
		assert_includes last_response.body, "<input"
    	assert_includes last_response.body, %q(<button type="submit")
		post "/users/signin", username: "admin", password: "secret"
		assert_equal 302, last_response.status
		get last_response["Location"]
		assert_includes last_response.body, "Login successful"
		assert_includes last_response.body, "Logged in"
		assert_equal "admin", session[:user]
	end

	def test_bad_login
		post "/users/signin", username: "incorrect", password: "also_incorrect"
		assert_equal 422, last_response.status
	end

	def test_logout
		post "/users/signout"
		assert_equal 302, last_response.status
		refute session[:user]
		get last_response["Location"]
		assert_includes last_response.body, "Logged out"
		assert_includes last_response.body, "Log In"
	end

	def test_login_required
		get "/test1.txt/edit"
		assert_equal 302, last_response.status
		assert_equal session[:error], "Login Required"
		post "/test1.txt"
		assert_equal 302, last_response.status
		assert_equal session[:error], "Login Required"
		get "/new"
		assert_equal 302, last_response.status
		assert_equal session[:error], "Login Required"
		post "/new"
		assert_equal 302, last_response.status
		assert_equal session[:error], "Login Required"
		post "/test1.txt/delete"
		assert_equal 302, last_response.status
		assert_equal session[:error], "Login Required"
		get "/test1.txt/edit", {}, admin_session
		assert_equal 200, last_response.status
		post "/test1.txt"
		assert_includes session[:success], "updated"
		get "/new"
		assert_equal 200, last_response.status
		post "/new", {title: "papaya", content: "Is delicious"}
		get "/"
		assert_includes last_response.body, "papaya"
		post "/test1.txt/delete"
		assert_includes session[:success], "deleted"

	end
	def test_admin_privilages
		get "/", {}, non_admin_user_session
		assert_equal session[:user], "mikmik"
		refute_includes last_response.body, "/users/users.yaml"
		get "/", {}, admin_session
		assert_includes last_response.body, "/users/users.yaml"
	end

	def test_register_new_user
		post "/users/register", :username => "baba_oriley", :password => "abc123&*("
		new_users = YAML.load_file("#{users_path}/new_users.yaml")
		assert_includes new_users, :baba_oriley
		post "/users/register", :username => "baba_oriley", :password => "abc123&*("
		assert_includes last_response.body, "Username unavailable. Please try another."
		post "/users/register", :username => "papa_smurf", :password => "password"
		assert_includes last_response.body, "Password should be at least 8"
		new_users = YAML.load_file("#{users_path}/new_users.yaml")
		refute_includes new_users, :papa_smurf
	end

end