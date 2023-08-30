items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items) if block_given?
  puts "Nice selection of food we have gathered!"
end

#
enum = Enumerator.new do |y|
  i = 1
  y << 0
  loop do
    y << (1..i).to_a.inject(:*)
    i += 1
  end
end

# p enum.next
# p enum.next
# p enum.next
# p enum.next
# p enum.next
# p enum.next
# p enum.next
# # p enum.next
# # p enum.next
# # p enum.next
# # p enum.next
# # p enum.next
# # p enum.next
# # p enum.next
# # p enum.next
# # p enum.next

# enum.rewind

# Group 1

def returns_proc
  a = "cheetos"
  proc {
    a << " more cheetos"
    puts a
  }
end

alpha = returns_proc
alpha.call
alpha.call


beta = returns_proc
beta.call
beta.call
alpha.call
beta.call