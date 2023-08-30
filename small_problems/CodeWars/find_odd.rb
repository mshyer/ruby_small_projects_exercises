=begin
Given an array of integers, find the integer that appears an odd number of times
ASSUME that there will always be only one that appears an odd number of times
  But there can be many different integers.
  [1,2,1, 3, 3] yields 2
Data: arrays
algorithm:
1. generate an array of unique digits
2. iterate through array. 
  a. count if that digit appears an odd number of times in original
  b. if it does, return that digit.

=end

# def count_odd(input)
#   uniq_arr = input.uniq
#   uniq_arr.each do |num|
#     return num if input.count(num).odd?
#   end
# end

=begin
Write a function that returns true/false depending on if a portion of str1 can be rearranged to form str2
  -don't worry about case or unique types of characters
Input: two strings
Output: true/false
Generally: check if ALL the characters in str2 are in str1. If they are, return true.
Data structure: chars array
Algorithm:
1. split str2 into array of chars
2. use all? method on chars array. str1.include? 

=end

def scramble(str1, str2)
  chars = str2.downcase.chars
  chars.all? {|char| str1.count(char) >= str2.count(char)}
end

#test cases
p scramble('', '') == true
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false