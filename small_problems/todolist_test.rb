require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo_list'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@list.first, @todos.first)
  end

  def test_last
    assert_equal(@list.last, @todo3)
  end

  def test_shift
    shifted = @list.shift
    assert_equal(shifted, @todo1)
    assert_equal(@list.to_a, @todos[1..])
  end

  def test_pop
    popped = @list.pop
    assert_equal(popped, @todo3)
    assert_equal(@list.to_a, @todos[0..-2])
  end

  def test_done?
    @list.mark_all_done
    assert_equal(@list.done?, true)
    @list.mark_all_undone
    assert_equal(@list.done?, false)
  end

  def test_undone
    @list.mark_all_done
    @list.undone!
    assert_equal([false, false, false], @list.todos.map{ |todo| todo.done })
  end

  def test_add_raise_error
    # begin
    #   @list.add("Cherry pie")
    # rescue TypeError => a
    #   assert_equal(a.class, TypeError)
    # end
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add("winner winner chicken dinner") }
  end

  def test_shovel
    todo4 = Todo.new("Test Todo")
    @todos << todo4
    @list << todo4
    #assert_includes(@list.to_a, todo4)
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    todo5 = Todo.new("Test Todo")
    @todos << todo5
    @list.add(todo5)
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at_raises_index_error
    assert_raises(IndexError) { @list.item_at(12) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo3, @list.item_at(2))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(12) }
    @list.mark_done_at(0)
    @list.mark_done_at(1)
    assert_equal(@list.item_at(0).done, true)
    assert_equal(@list.item_at(2).done, false)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(12) }
    @list.mark_all_done
    @list.mark_undone_at(1)
    assert_equal(true, @list.item_at(0).done?)
    assert_equal(false, @list.item_at(1).done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.mark_all_undone
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(12) }
    a = @list.remove_at(2)
    assert_equal(a, @todo3)
    assert_equal(@todo2, @list.to_a.last)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    output2 = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [X] Go to gym
    OUTPUT

    output3 = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
    @list.mark_done_at(2)
    assert_equal(output2, @list.to_s)
    @list.mark_all_done
    assert_equal(output3, @list.to_s)
  end

  def test_each
    result = []
    returned_value = @list.each { |todo| result << todo }
    assert_equal(result, [@todo1, @todo2, @todo3])
    assert_equal(returned_value, @list)
  end

  def test_select
    @list.mark_all_done
    @list.mark_undone_at(1)
    result = []
    selected = @list.select { |todo| todo.done?}
    assert_equal(TodoList, selected.class)
    assert_equal(selected.todos, [@todo1, @todo3])
  end

  def test_mark_done
    @list.mark_all_undone
    @list.mark_done("Buy milk")
    assert_equal(@todo1.done, true)
  end

end