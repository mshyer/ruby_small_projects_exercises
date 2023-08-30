def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

loop do 
  puts "Please enter ONE NEGATIVE and ONE POSITIVE number"
  int1 = gets.chomp
  if !valid_number?(int1)
    puts "that is not a valid number"
    next
  end
  int2 = gets.chomp
  if !valid_number?(int2)
    puts "that is not a valid number"
    next
  end
  if int1.to_i.negative? && int2.to_i.negative?
    puts "both values negative. Please enter ONE POSITIVE and ONE NEGATIVE value"
    next
  end
  if int1.to_i.positive? && int2.to_i.positive?
    puts "both values positive. Please enter ONE POSITIVE and ONE NEGATIVE value"
    next
  end
  puts "the sum of #{int1} and #{int2} is #{(int1.to_i + int2.to_i)}"
  break
end

