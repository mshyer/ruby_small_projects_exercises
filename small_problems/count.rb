require "pry" # add this to use Pry

counter = 0

loop do
  counter += 1
  binding.pry
  break if counter == 5
end

mapped_array = array.map { |num| num + 1 }

mapped_array.tap { |value| p value }              # => [2, 3, 4]