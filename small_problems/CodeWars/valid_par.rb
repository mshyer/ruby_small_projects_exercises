=begin
code determines if a string contains a valid set of parentheses 
() valid
()) invalid
(((()))) valid
(()()))) invalid
Input: string
Output: true/false

Data structure: array of characters

Algorithm
1. create left counter 0
2. create right counter 0
3. iterate through array of characters
  a. if char is ( left += 1
  b. if char is ) right += 1
  if right > left, return false
4. return false if left != right
5. return true

=end

def valid_parentheses(string)
  left = 0
  right = 0
  string.chars.each do |char|
    if char == "("
      left += 1
    elsif char == ")"
      right += 1
    end
    return false if right > left
  end
  return false if left != right
  true
end