#method takes string input. Outputs an array of all substrings that are palindromes
#method that takes input of str and returns output array with all substrings of that string 2 or more chars
#method that checks if substring is palindrome

def substrings(string)
  substrings_array = []
  counter_A = 0
  counter_B = 1
  loop do
    loop do
      if string[counter_A..counter_B].length > 1 
        substrings_array << string[counter_A..counter_B] 
      end
      counter_B += 1
      break if counter_B >= string.length
    end
    counter_A += 1
    counter_B = counter_A + 1
    break if counter_A >= string.length
  end
  return substrings_array.uniq
end


def ispalindrome?(str)
  str.reverse == str
end

def find_all_palindromes(string)
  array_of_substrings = substrings(string)
  palindrome_array = []
  array_of_substrings.each do |item|
    if ispalindrome?(item)
      palindrome_array << item
    end
  end
  palindrome_array
end

puts ispalindrome?("ama")
#puts substrings("ahaha")
#puts substrings("pneumonoultramicroscopic")
puts find_all_palindromes("snowwhiteandthesevendwarves")
#Init 1counter 0
#Init 2counter 1
#Loop from counter 0 to  (endindex-1)
#loop 1: break if 1counter == endindex
  #loop 2: 
    #str.slice(1counter, 2counter)
    #2counter += 1
    #break if 2counter == indindex
  #1counter += 1
  #break if 1counter == endindex



#Return counterindex to endindex
  #str[i, ]

#return counter + 1
#break if counter == endindex
# 0 -1
#0-2
#0-3
# puts ispalindrome?("mam")

# puts ispalindrome?("Mam")

# puts ispalindrome?("abracadabra")

# puts ispalindrome?("iiieeefffeeeiii")