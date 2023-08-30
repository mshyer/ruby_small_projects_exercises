#Write a loop that prints numbers 1-5 and 
#whether the number is even or odd. Use the code below to get started.

count = 1

loop do
  if count.even?
    puts count.to_s + " is an even number"
  else
    puts count.to_s + " is an odd number"
  end
  count += 1
  if count == 6
    break
  end
end