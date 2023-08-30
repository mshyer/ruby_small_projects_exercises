require 'pry'
NUMBERS = { 1 => "ONE", 2 => "TWO", 3 => "THREE", 4 => "FOUR",
           5 => "FIVE", 6 => "SIX", 7 => "SEVEN", 8 => "EIGHT",
          9 => "NINE", 0 => "ZERO" }
def word_to_digit(string)
  output_arr = []
  string.split(' ').each do |word|
    if NUMBERS.values.include?(word.upcase.delete('^a-zA-Z'))
      output_arr << (NUMBERS.key(word.upcase.delete('^a-zA-Z')).to_s) + word.delete('a-zA-Z')
    else
      output_arr << word
    end
    #binding.pry
  end
  p output_arr.join(" ")
end

# def word_to_digit(string)
#   NUMBERS.keys.each do |int|
#     words.gsub{ /\b#{word}\b/, NUMBERS[word] } 
# end


p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

