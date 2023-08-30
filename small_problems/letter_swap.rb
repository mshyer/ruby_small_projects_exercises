# Given a string of words separated by spaces, write a method that takes this string of words 
# and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always 
# contain at least one word. You may also assume that each string contains nothing but words and spaces
require 'pry'

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words_string)
  words_arr = words_string.split(" ")
  words_arr.map! do |word|
    swap_first_last_characters(word)
    # if word.length > 1
      # word_cutout = word.slice(1..-2)
      # word_cutout.prepend(word[-1])
      # word_cutout << word[0]
      # word_cutout
    # else word
    #end
  end
  p words_arr.join(" ")
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'