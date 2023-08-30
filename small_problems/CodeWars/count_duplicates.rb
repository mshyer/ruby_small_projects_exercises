=begin
PEDAC
function returns the number of distinct duplicate alphanumeric charactes in a string, case insensitive
input: string
output: integer
data structure: array of chars 
algorithm:
1. create an array of chars.
  a. should be downcase and uniq
2. create a duplicate of string, downcase it.
3. init output counter variable
4. iterate through the array of unique characters
  a. str.count character
  b. if 2 or greater, add one to counter
5. return counter

=end

def count_duplicates(str)
  lowercase = str.downcase
  counter = 0
  chars_arr = lowercase.chars.uniq
  chars_arr.each do |char|
    if lowercase.count(char) >= 2
      counter += 1
    end
  end
  counter
end

p count_duplicates("aaBBcC")