#Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  value.each do |string|
    for letter_item in string.chars
      puts letter_item if ["a", "e", "i", "o", 'u', 'y', 'A', 'E', 'I', 'O', 'U', 'Y'].include?(letter_item)
    end
  end
end
