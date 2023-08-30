# Build a program that displays when the user will retire
# and how many years she has to work till retirement.

year = Time.now.year

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

puts("You have to work for #{retirement_age - age} more years before retirement")
puts("It's #{year}. You can finally retire in #{year + (retirement_age - age) }")