## this program asks user to type 
## their name then prints out message with their name included
puts 'Please enter your first name'
userinputfirstname = gets.chomp
puts 'Please enter your last name'
userinputlastname = gets.chomp
puts 'hello ' + userinputfirstname + ' ' + userinputlastname + '. Welcome to the jungle!'
exit