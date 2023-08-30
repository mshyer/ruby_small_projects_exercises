USERNAME = "DarkHelmet"
PASSWORD = "12345"

loop do 
  puts "Please enter the system username"
  user_input_username = gets.chomp
  puts "Please enter the ststem password"
  user_input_password = gets.chomp
  break if user_input_password == PASSWORD && user_input_username == "DarkHelmet"
  puts "invalid username or password"
end
puts "Welcome to the system, have a cigar."