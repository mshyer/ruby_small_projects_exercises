
def anagrams(word_list)
  anagrams = []
  anagram_keys = word_list.map { |word| word.chars.sort.join("") }.uniq
  anagram_keys.each do |key|
    anagrams << word_list.select do |word|
      word.chars.sort.join("") == key
    end
  end
  anagrams.each do |array|
    p array
  end
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
'flow', 'neon']

anagrams(words)