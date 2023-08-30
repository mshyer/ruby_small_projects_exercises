
def mantra
  puts "How many times should I recite our mantra?"
  user_input = gets.chomp.to_i
  if user_input >= 3
    user_input.times do 
      puts "Launch School is the Best!"
    end
  elsif user_input <3 && user_input > 0
    puts "Come on now, we need to at least recite the mantra 3 times!"
    mantra
  else
    mantra
  end
end
  
mantra