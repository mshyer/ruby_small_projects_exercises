=begin
Method replicates pig latin by moving first char to end and adding "ay". 
The tricky part is ignoring punctuation.
Test cases appear to have spaces before the punctuation marks... so I can probably split them by space
Data structure: words array

Algorithm:
1. Split input string into array of words
2. if word length greater than 1,
  map helper method igpay on each word
  if word length is 1, map returns word
3. helper method igpay:
    a. split string into array of chars
    b. arr << arr.shift
    c. arr << "ay"
    d. returns the arr.join("")
=end

def pig_it(str)
  words = str.split(" ")
  words.map! do |word|
    if word.length <= 1
      word
    else
      igpay(word)
    end
  end
  words.join(" ")
end

def igpay(word)
  chars = word.chars
  chars << chars.shift
  chars << "ay"
  chars.join("")
end


#test cases
p pig_it('Pig latin is cool') # igPay atinlay siay oolcay
p pig_it('Hello world !')     # elloHay orldway !