require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

before do
	@user_data = YAML.load_file("public/users.yaml")
	@users = @user_data.keys.map {|symbol| symbol.to_s.capitalize }
end

helpers do
  def user_count
	@user_data.keys.count
  end

  def interests_count
  	interests_count = 0
  	@user_data.values.each do |hash|
  		interests_count += hash[:interests].count
  	end
  	interests_count
  end
end

get '/' do
	redirect "/users"
end

get '/users' do
	@title = "Users"
	erb :users
end
get '/users/' do
	redirect '/users'
end

get '/users/:user' do |user|

	@title = params["user"].capitalize
	erb :user
end