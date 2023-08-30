# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.class == Todo
    todos << todo
    todos
  end

  alias_method :<<, :add

  # def <<(todo)
  #   add(todo)
  # end

  def size
    todos.length
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def done?
    todos.all?(&:done?)
  end

  def item_at(position)
    todos.fetch(position)
  end

  def mark_done_at(position)
    todos.fetch(position).done!
  end

  def mark_undone_at(position)
    todos.fetch(position).undone!
  end

  def done!
    todos.each(&:done!)
  end

  def undone!
    todos.each(&:undone!)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(position)
    # todos.fetch(position)
    # todos.delete_at(position)
    todos.delete(item_at(position))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    todos.each { |todo| yield(todo) }
    self
  end

  def select
    #todos.select { |todo| yield(todo) }
    output = TodoList.new(title)
    todos.each do |todo|
      output << todo if yield(todo)
    end

    output
  end

  ###METHODS USING TodoList#each and TodoList#select methods
  def find_by_title(title)
    select{ |todo| todo.title == title}.first
  end

  def all_done
    select{ |todo| todo.done? }
  end

  def all_not_done
    select{ |todo| !todo.done? }
  end

  def mark_done(str)
    each do |todo|
      if str == todo.title
        todo.done!
        return
      end
    end
  end

  def mark_all_done
    each(&:done!)
  end

  def mark_all_undone
    each(&:undone!)
  end

end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!
todo2.done!

puts list.to_s

# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect

p list.find_by_title("Buy milk")
p list.all_done
p list.all_not_done
# list.mark_done("Go to gym")
# p list.all_done
list.mark_all_done
puts list.to_s
list.mark_all_undone
puts list.to_s