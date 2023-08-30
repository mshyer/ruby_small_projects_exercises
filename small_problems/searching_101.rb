# Write a program that solicits 6 numbers from the user, then prints a message that 
# describes whether or not the 6th number appears amongst the first 5 numbers.

puts "Enter the first number"
first = gets.chomp.to_i
puts "Enter the second number"
second = gets.chomp.to_i
puts "Enter the third number"
third = gets.chomp.to_i
puts "Enter the fourth number"
fourth = gets.chomp.to_i
puts "Enter the fifth number"
fifth = gets.chomp.to_i
puts "Enter the sixth number"
sixth = gets.chomp.to_i

puts [first, second, third, fourth, fifth].include?(sixth) ?  "the sixth is in" :  "the sixth is whack yo"