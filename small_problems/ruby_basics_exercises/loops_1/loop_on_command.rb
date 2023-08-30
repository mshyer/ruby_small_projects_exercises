#Modify the code below so the loop stops iterating when the user inputs 'yes'.
loop do
  yes_array = ["Yes", "yes", "Y", "y"]
  puts 'Should I stop looping?'
  answer = gets.chomp
  if yes_array.include?(answer) 
    break
  end
end