#Write a program that displays a welcome message, but only after the user enters the correct password,
# where the password is a string that is defined as a constant in your program. 
#Keep asking for the password until the user enters the correct password.

PASSWORD = "1234"

loop do 
  puts "Please enter the system password"
  user_input = gets.chomp
  break if user_input == PASSWORD
  puts "invalid password"
end
puts "Welcome to the system, have a cigar."