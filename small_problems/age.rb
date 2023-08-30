## This is a program that that asks a user how old they are and then
## tells them how old they will be in 10, 20, 30 and 40 years.
puts 'Hello User. How old are you in years?'
userinputage = gets.chomp
userinputage = userinputage.to_i
10.times do
  puts userinputage
end
puts 'in 10 years you will be ' + (userinputage+10).to_s + " years old."
puts 'in 20 years you will be ' + (userinputage+20).to_s + " years old."
puts 'in 30 years you will be ' + (userinputage+30).to_s + " years old."
puts 'in 40 years you will be ' + (userinputage+40).to_s + " years old."
exit