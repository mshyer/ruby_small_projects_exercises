require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"
require "sinatra/content_for"

configure do
  enable :sessions
  set :session_secret, 'c762eabfeb73461ed6daf1ab63d117c7f3c02ddf4f10a2d5c6c1560e517db061'
  set :erb, :escape_html => true
end

helpers do
  def list_complete?(list)
    todos_count(list) > 0 && todos_remaining_count(list) == 0
  end

  def list_class(list)
    "complete" if list_complete?(list)

  end

  def todos_count(list)
    list[:todos].size
  end

  def todos_remaining_count(list)
    list[:todos].count {|todo| todo[:completed] == false}
  end

  def sort_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition { |list| list_complete?(list) }

    # incomplete_lists.each { |list| yield list, lists.index(list) }
    incomplete_lists.each { |list| yield list, list[:id] }
    # complete_lists.each { |list| yield list, lists.index(list) }
    complete_lists.each { |list| yield list, list[:id] }
  end

  def sort_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition { |todo| todo[:completed] }

    incomplete_todos.each { |todo| yield todo, todos.index(todo) }
    complete_todos.each { |todo| yield todo, todos.index(todo) }
  end
#deprecated sort method for future reference
  # def sort_todos(todos, &block)
  #   incomplete_todos = {}
  #   complete_todos = {}
  #   todos.each_with_index do |todo, index|
  #     if todo[:completed]
  #       complete_todos[todo] = index
  #     else
  #       incomplete_todos[todo] = index
  #     end
  #   end
  #   incomplete_todos.each(&block)
  #   complete_todos.each(&block)
  # end
end

before do
  session[:lists] ||= []
end




get "/" do
  redirect "/lists"
end

# GET /lists       -> view all lists
# GET /lists/new   -> new list form
# POST /lists      -> create new list
# GET /lists/1     -> view a single list
# GET /users
# GET /users/1



# view all of lists
get "/lists" do
    @lists = session[:lists]
  erb :lists, layout: :layout
end

# Render the new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end
get "/lists/" do
  redirect "/lists"
end

# Return an error message if the name is invalid. Return nil if name valid.
def error_for_list_name(name)
  if !(1..100).cover? name.size
    "List name must be between 1 and 100 characters"
  elsif session[:lists].any? { |list| list[:name] == name }
    "List name must be unique"
  end
end


def next_list_id(lists)
  max = lists.map { |list| list[:id] }.max || 0
  max + 1
end

# Create a new list
post "/lists" do
  list_name = params[:list_name].strip
  @list_name = params[:list_name]
  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    lists = session[:lists]
    id = next_list_id(lists)
    session[:lists] << { name: list_name, todos: [], id: id}
    session[:success] = "The list has been created."
    redirect "/lists"
  end
end

#View a single todo list
def load_list(index)
  index = index.to_i
  list = session[:lists].find {|list| list[:id] == index }
  # list = session[:lists][index - 1] if index && index > 0 && session[:lists][index - 1]
  return list if list
  session[:error] = "The requested list does not exist"
  redirect "/lists" 
end

get "/lists/:id" do |url_id|
  url_id = url_id.to_i
  @list_id = url_id
  @list = load_list(url_id)
  erb :list, layout: :layout
end

# Edit an existing todo list
get "/lists/:id/edit" do |id|
  @id = id
  @list = session[:lists].find {|list| list[:id] == id.to_i}
  erb :edit_list, layout: :layout
end

# Update an existing todo list
post "/lists/:id" do |id|
  @id = id
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)
  @num = id.to_i
  @list = session[:lists][@num - 1]
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    session[:lists][id.to_i - 1][:name] = list_name
    session[:success] = "The list has been updated."
    redirect "/lists/#{id}"
  end
end

# Delete a todo list
post "/lists/:id/destroy" do |id|
  id = params[:id].to_i
  session[:lists].reject! { |list| list[:id] == id }
  # session[:lists].delete_at(id - 1)
  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    "/lists"
  else
    session[:success] = "The list has been deleted."
    redirect "/lists"
  end
end


def error_for_todo(name)
  if !(1..100).cover? name.size
    "Todo must be between 1 and 100 characters"
  end
end


def next_todo_id(todos)
  max = todos.map { |todo| todo[:id] }.max || 0
  max + 1
end


# Add a new todo to a list
post "/lists/:list_id/todos" do |list_id|
  @id = list_id
  @list_id = list_id.to_i
  @list = load_list(list_id)
  # @list = session[:lists][@list_id - 1]
  text = params[:todo].strip
  
  error = error_for_todo(text)

  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    id = next_todo_id(@list[:todos])
    @list[:todos] << { id: id, name: text, completed: false }
    session[:success] = "The todo was added"
    redirect "/lists/#{@list_id}"
  end 
end

post "/lists/:list_id/todos/:todo_id/destroy" do |list_id, todo_id|
  @list_id = list_id.to_i
  @list = load_list(list_id)
  todo_id = params[:todo_id].to_i
  # @list[:todos].delete_at(todo_id.to_i)
  @list[:todos].reject! { |todo| todo[:id] == todo_id}
  puts env["HTTP_X_REQUESTED_WITH"]
  puts "testing testing 123"
  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    #ajax
    status 204
  else
    session[:success] = "The todo was deleted!"
    redirect "/lists/#{list_id}"
  end
end

# Update the status of a todo
post "/lists/:list_id/todos/:todo_id" do | list_id, todo_id |
  @list_id = list_id.to_i
  @todo_id = todo_id.to_i
  @list = load_list(list_id)
  # @list = session[:lists][@list_id - 1]
  is_completed = params[:completed] == "true"

  todo = @list[:todos].find { |todo| todo[:id] == @todo_id}
  # @list[:todos][@todo_id][:completed] = is_completed
  todo[:completed] = is_completed

  session[:success] = "The todo was updated."
  redirect "/lists/#{@list_id}"
end

# Mark all todos as complete for a list
post "/lists/:id/complete_all" do |id|
  @list_id = id.to_i
  @list = load_list(id)
  # @list = session[:lists][@list_id - 1]
  @list[:todos].each {|todo| todo[:completed] = true}
  session[:success] = "All todos have been completed"
  redirect "/lists/#{id}"
end










