=begin
Problem: Create a circular queue. 
-A new item is added to the position that immediately follows the most recently-added object
-When removing items, the oldest item is removed
-The buffer is of a fixed size and operates in a circular fashion

Overall:
need two indices: one for the oldest item, one for the next position to add
Adding items: 
1. Look at current index
  a. if there is an item there, remove it.
    1. Index of oldest item equals that position plus one
    b. replace old with the new item
    c. adder plus equals one
  c.if there is no item there, add the new item.
    a. iterate adder index by 1
  d.If the index is greater than max index, it goes back to 1
2. Dequeing items
  a. delete at the index of the oldest item. 
    b. Iterate oldest index by 1
    c. if the oldest index equals max buffer, revert it back to 1
  b. The index of oldest item starts at 1
=end
require 'pry'
class CircularQueue
  attr_reader :max_buffer
  attr_accessor :adder, :oldest, :queue
  def initialize(length)
    @queue = []
    @max_buffer = length
    @adder = 0
    @oldest = 0
  end

  def enqueue(item)
    if queue[adder] != nil
      queue[adder] = nil
      self.oldest = adder
      self.oldest = increment(oldest)
      enqueue(item)

    else
      queue[adder] = item
      self.adder = increment(adder)
    end
    p queue
    #binding.pry
  end

  def dequeue
    #p "Oldest : #{oldest}"
    a = queue[oldest]
    queue[oldest] = nil
    p queue
    self.oldest = increment(oldest) if queue.length > 1
    a
  end

  private
  def increment(position)
    position = (position + 1) % max_buffer
  end
  #binding.pry
end

#test cases
queue = CircularQueue.new(3)
# queue.enqueue(1)
# queue.enqueue(2)
# queue.enqueue(3)
# queue.enqueue(4)
# queue.enqueue(5)
# queue.dequeue
# queue.enqueue(6)
# queue.enqueue(7)
# queue.enqueue(8)
# queue.enqueue(9)
# queue.enqueue(10)

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil