numbers = [5, 9, 21, 26, 39]

divisible_by_three = numbers.select {|item| item%3 == 0}

puts divisible_by_three