# Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line

(1..99).to_a.each {|a| puts a if a.even?}

a = []
1.upto(99){|i| a << i if i.even?}

p a