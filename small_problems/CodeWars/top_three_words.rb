=begin
method returns the top 3 most frequently used words in a text
word can have characters and apostraphes. others are not part of word and are considered white space (delimeters)
haha&&aa = "haha" and "aa"
matches are case-insensitive
ties broken arbitrarily. If fewer than 3 distinct words, return the top 2 or top 1 or empty array.

Input: string
Output: array of strings or empty array

Data structure: regex and arrays

Algorithm:
1. SCAN the input text to get array of all the words
  a. words_arr = str.scan(/\b[a-z']+\b/i)
b. map the scanned array to be all lowercase
c. create a uniq array of words
d. sort the uniq array by the frequency of their occurence in the full array
e. return the last 3 items

=end

def top_3_words(text)
  words = text.scan(/\b[a-z']+\b/i)
  words.map! { |word| word.downcase }
  uniq_arr = words.uniq
  top_three = (uniq_arr.sort_by {|word| words.count(word)})
  top_three[-3..-1].reverse
end


text = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."

top_3_words(text)