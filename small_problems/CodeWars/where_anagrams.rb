=begin
PEDAC
write a method that takes two inputs, a string and an array of strings. 
The method returns an array with all the anagrams of the input word found in the input array
  -returns an EMPTY array if there are no anagrams

Algorithm:

init output array
1. iterate through each item in the input array
2. rim Helper method anagram? (true/fals)
  a. if true, append the item to array
3. return the array

anagram? method (input, iterated item)
  a. do the characters exactly match the characters?
    if so return true


=end

def anagrams(input_word, array)
  output = []
  array.each do |word|
    output << word if anagram?(input_word, word) 
  end
  p output
end

def anagram?(input, iword)
input.chars.sort == iword.chars.sort
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']