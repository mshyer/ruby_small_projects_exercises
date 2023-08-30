def neutralize(sentence)
  words = sentence.split(' ')
  words_dup = words.dup
  words_dup.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end
puts neutralize('These dull boring cards are part of a chaotic board game.')
puts neutralize('These dull boring cards are part of a chaotic board game.') == "These cards are part of a board game."
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.