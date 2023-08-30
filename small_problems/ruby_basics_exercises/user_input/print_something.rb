#Write a program that asks the user whether they want the program to print "something", 
#then print it if the user enters y. Otherwise, print nothing.


def print
  puts "Would you like to print something? (y/n)" 
  user_input = gets.chomp
  if user_input.downcase == "yes" || user_input.downcase == "y"
    puts "something"
  elsif user_input.downcase == "no" || user_input.downcase == "n"
    puts "you're no fun"
  else
    puts "error, invalid input. Please enter (y/n)"
    print()
  end
end

print()