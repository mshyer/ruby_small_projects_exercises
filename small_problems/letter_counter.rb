# Write a method that takes a string with one or more space separated words and 
# returns a hash that shows the number of words of different sizes.
# Words consist of any string of characters that do not include a space.

def word_sizes(sentence_string)
  counter_hash = Hash.new(0)
  cleaned_words_arr = sentence_string.split(" ").map do |word|
    word.delete('^a-zA-Z ')
  end
  cleaned_words_arr.each do |word|
    counter_hash[word.length] += 1
  end
  p counter_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
