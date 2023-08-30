# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants 
# to determine the sum or product of all numbers between 1 and the entered integer.

loop do
  puts "Please enter an integer greater than 0."
  user_input_number = gets.chomp.to_i
  puts "Choose 1: sum or product? (enter \"sum\" or \"product\")"
  user_input_choice = gets.chomp.downcase

  if user_input_choice.start_with?("s")
    sum = (1..user_input_number).to_a.sum
    puts sum
  elsif user_input_choice.start_with?("p")
    product = (1..user_input_number).inject(:*)
    puts product
  else
    puts "error, invalid input"
  end
end