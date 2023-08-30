#Modify the code below so "Hello!" is printed 5 times.


say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
  counter += 1
  if counter > 4
    say_hello = false
  end
end