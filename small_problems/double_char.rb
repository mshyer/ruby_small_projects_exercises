CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def repeater(str)
  output = ""
  str.each_char { |char| output << char << char}
  output
end

def double_consonants(str)
  repeated = repeater(str)
  repeated.squeeze!("^a-zA-Z")
  repeated.squeeze!("aeiouAEIOU")
  repeated
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("JUly 4th") == "JJUllyy 4tthh"
p double_consonants('') == ""