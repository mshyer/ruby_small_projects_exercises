=begin
write a program that prints the longest sentence in text and prints the number of words
sentence defined by ! ? and .
every other non-space character treated as part of a word

data structure: array of strings representing sentences
algorithm: 
1. split input text into sentences
  a. use regex /[?!.]/
2. sort according to sentence length
3. return the largest sentence
4. count words in largest sentence
  a. sentence split (" ") length

=end

text = File.read('text.txt')
text = text.delete("\n")
p text

# sentences = text.split(/[!?.]/)

# longest = sentences.sort_by do |sentence| 
#   sentence.split(" ").length
# end[-1]
# #p longest
# p longest.gsub("\n", " ").split(" ").length
# p longest.split(" ").length

sentences = []

dup = text.dup
loop do
  sentences << dup.slice!(/.*/)
end