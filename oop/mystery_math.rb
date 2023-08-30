=begin

Replace the first math operating symbol with ? and return resulting string
-use SUB not GSUB to substitute the first instance of any math symbol

=end

def mystery_math(str)
  p str.sub(/[+\-*%\/=]/, "?")
end

mystery_math('4 + 3 - 5 = 2') # -> '4 ? 3 - 5 = 2'
mystery_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 + 2) / 7 - 1 = 1'

#Now write a method that changes them all to ?

def mysterious_math(str)
  p str.gsub(/[+\-*%\/=]/, "?")
end



mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'