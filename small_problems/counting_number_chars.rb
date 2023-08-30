# Write a program that will ask a user for an input of a word or multiple words and 
# give back the number of characters. Spaces should not be counted as a character.

puts "please enter some text and we will count the characters, not including spaces"
user_input_text = gets.chomp

p user_input_text.split(" ").join.length

p user_input_text.delete(" ").size