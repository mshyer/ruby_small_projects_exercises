=begin
Problem: Implement a circular queue using arr push and shift methods

1
1 2
nil 2 (shift ) arr[0] = nil
arr[nil]
nil 2 3 (push)
nil nil 3

so the oldest marker is at 1
arr[0...oldest] + arr[oldest..-1].specialshift

oldest marker is at 2
arr[0...oldest]

1 
1 2
nil 2
nil 2 3
2 3 4
3 4 5
=end

class CircularQueue
  attr_reader :size, :new_queue

  def initialize(size)
    @new_queue = Array.new
    @size = size 
  end

  def dequeue
    new_queue.shift 
    p new_queue
  end

  def enqueue(element)
    dequeue if new_queue.count == size
    new_queue << element
    p new_queue
  end
end

queue = CircularQueue.new(3)
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)
queue.dequeue
queue.enqueue(6)
queue.enqueue(7)
queue.enqueue(8)
queue.enqueue(9)
queue.enqueue(10)

# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil