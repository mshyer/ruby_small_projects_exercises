##Write a program that prints a greeting message. This program should 
##contain a method called greeting that takes 
##a name as its parameter and returns a string.

puts "Please enter your name"

def greeting(name)
  "Hello #{name}, nice to meetcha"
end

puts greeting(gets.chomp)