=begin
Write a program that determines if an input stirng is all alphanumeric
Returns true/false
empty string returns false
will  not test nil

data structure: CONSTANTS and array of chars

algorithm:
1. create CONSTANT of all valid characters and numbers, all lowercase
2. return false if string empty
3. iterate through chars in string
  a. if CONSTANT doesn't contain the character, return false
4. return true


=end

VALID_CHARS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0)

def alphanumeric?(string)
  return false if string.empty?
   puts string =~ /[a-b]/
  string.chars.each do |char|
    return false if !VALID_CHARS.include?(char.downcase)
  end
  return true
end

p alphanumeric?("")
p alphanumeric?("hello world_")
p alphanumeric?("HELLOworld123")