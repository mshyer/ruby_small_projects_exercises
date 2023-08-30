factorio = Enumerator.new do |x|
  a = 1
  loop do
    x << (1..a).to_a.inject(:*)
    a += 1
  end
end
p factorio.next
p factorio.next
p factorio.next
p factorio.next
p factorio.next
p factorio.next
p factorio.next
p factorio.take(7)

# The version from the example solution sets the accumulator equal to the sum of all factors below n. 
#So 6 factorial is 720, all factors 5-1 multiplied together is 120, so 6 * 120, 120 is the accumulator. 


factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

# External iterators

6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
p factorial.take(6)
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
factorial.rewind
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="

# Internal iterators

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end

# 0, 0
# << 1
# 1, 1
# << 1
# 2, 1
# << 2
# 3, 2
# << 6
# 4, 6
# << 24
# 5, 24
# << 120
# 6, 120