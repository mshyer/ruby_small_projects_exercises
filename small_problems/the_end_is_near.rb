# Write a method that returns the next to last word in the String passed to it as an argument.
# Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two words.

def penultimate(sentence)
  sentence.split(" ")[-2]
end



def middle_word(sentence)
  word_array = sentence.split(" ")
  word_array.length.odd? ? word_array[(word_array.length)/2] : word_array[(word_array.length/2-1)..word_array.length/2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

p middle_word("Welcome to the Jungle")
p middle_word("Welcome to the Jungle. We got fun and games.")
p middle_word("I like to eat pineapple pie apples")
p middle_word("I like to eat pineapple pudding pie apples")
p middle_word("Welcome")