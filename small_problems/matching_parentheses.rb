def balanced?(str)
  parens = 0
  str.each_char do |char|
    parens += 1 if char == "(" 
    parens -= 1 if char == ")"
    break if parens < 0
  end
  quotes = 0
  str.each_char do |char|
    quotes += 1 if char == "\""
  end
  parens.zero? && quotes.even?
end


# def balanced?(str)
#   return false unless str.count("(") == str.count(")")
#   parentheses = str.delete("^()").chars
#   left = 0
#   right = 0
#   loop do
#     break if parentheses.empty?
#     if parentheses.shift == "("
#       left += 1
#     else
#       right += 1
#     end
#     if right > left 
#       return false
#     end
#   end
#   true
#end

p balanced?('What (is)"" this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false