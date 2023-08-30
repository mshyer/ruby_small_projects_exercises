# Write a method that returns true if the string passed as an argument is a palindrome, 
# false otherwise. A palindrome reads the same forward and backward. For this exercise, 
# case matters as does punctuation and spaces.

def palindrome?(string)
  string.downcase == string.downcase.reverse 
end

def cool_palindrome?(string)
  cool_string = string.downcase.delete('^a-z0-9')
  palindrome?(cool_string)
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

p cool_palindrome?("Madam, I'm Adam")