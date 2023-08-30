#sequence of integers
#begins with two
#Integers are consecutive
#Each "row" has the same number of integers as the row number
# Each row starts with the number following the sum of all previous rows elements
  #so 5th row would begin with the (1+ 4 + 3 + 2 + 1) element 

#Generate an array of 2s (2,4,6) of the appropriate size according to the number. Return the last elemtn


def row_start(row_number)
  twos_array = []
  counter = row_number-1
  start_value = 0
  total_values = 1
  while counter >= 0 
    total_values += counter
    counter -= 1
  end
  counter = 0
  total_values.times do
    start_value += 2
  end
  puts "yee haw #{start_value}"
  start_value
end


def row_value(row_number)
  counter = row_start(row_number)
  total = 0
  (row_number).times do
    total += counter
    counter += 2
  end
  total
end

puts "The sum of the nth row is #{row_value(10)}"

# 2
# 4 6
# 8 10 12
# 14 16 18 20