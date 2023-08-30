# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

(1..99).to_a.each{|item| puts item if item.odd?}
a = []
1.upto(99){|i| a << i if i.odd?}
p a