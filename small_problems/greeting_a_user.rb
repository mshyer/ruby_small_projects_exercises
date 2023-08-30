# Write a program that will ask for user's name. The program will then greet the user.
# If the user writes "name!" then the computer yells back to the user.

user_input_name = gets.chomp

if user_input_name[-1] == "!"
  cut_name = user_input_name[0..-2]
  puts "HELLO WHY ARE WE SCREAMING #{cut_name.upcase}??"
else 
  puts "Hello #{user_input_name}."
end