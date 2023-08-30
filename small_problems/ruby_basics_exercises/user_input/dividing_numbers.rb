def valid_number?(number_string)
  number_string.to_i.to_s == number_string 
end
int1 = nil
int2 = nil

loop do
  puts "enter the numerator"
  int1 = gets.chomp
  if !valid_number?(int1)
    puts "please enter a valid number"
  end
  break
end

loop do
  puts "enter the denominator"
  int2 = gets.chomp
  if valid_number?(int2) && int2.to_i != 0
    puts "#{int1}/#{int2} is #{int1.to_i/int2.to_i}"
    break
  else
    puts "please enter a valid denominator"
  end
end



