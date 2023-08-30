words = 'car human elephant airplane'
plurals = []

word_array = words.split(" ")
word_array.each do |item|
  plurals << item + "s"
end

puts plurals