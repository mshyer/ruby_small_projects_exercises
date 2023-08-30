
def mantra
  puts "How many times should I recite our mantra?"
  user_input = gets.chomp
  if user_input.to_i >= 3
    user_input.to_i.times do 
      puts "Launch School is the Best!"
    end
    mantra
  elsif user_input.to_i <3 && user_input.to_i > 0
    puts "Come on now, we need to at least recite the mantra 3 times!"
    mantra
  elsif user_input.downcase == "q" 
    puts "Peace be with you in your travels. Always remember Launch School."
  else
    mantra
  end
end
  
mantra