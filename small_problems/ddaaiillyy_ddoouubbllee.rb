# Write a method that takes a string argument and returns a new string 
# that contains the value of the original string with all consecutive 
# duplicate characters collapsed into a single character. You may not 
# use String#squeeze or String#squeeze!.

def crunch(string)
  unique_arr = []
  current_char = ""
  string.chars.each do |char|
    unique_arr << char unless current_char == char
    current_char = char
  end
  p unique_arr.join("")
end

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''