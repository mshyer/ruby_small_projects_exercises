=begin
program replicates "mexican wave" in sports arenas in strings
1.  The input string will always be lower case but may be empty.
2.  If the character in the string is whitespace then pass over it as if it was an empty seat

Input: lowercase string or empty string
Output: ARRAY of strings

Algorithm:
1 init output array
2. init dup string
3.string.length times |idx|
  a. if str[idx] is white space, next
  b. else, dup string[idx] = dupstring[idx].upcase
  c. arr << dup_string
  d. dup_str = dupstring.downcase
4. return output array
=end
require 'pry'
def mexican_wave(str)
  output_arr = []
  str.length.times do |i|
    if str[i] == " "
      next
    else
      dup_str = str.downcase
      dup_str[i] = dup_str[i].upcase
      output_arr << dup_str
    end
  end
  p output_arr
end

mexican_wave("abcd")