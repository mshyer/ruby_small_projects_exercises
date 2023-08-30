puts "enter a number for countdown to ignition"
x = gets.chomp.to_i

while x >= 0
  puts x
  x -= 1
end
puts "liftoff!!"