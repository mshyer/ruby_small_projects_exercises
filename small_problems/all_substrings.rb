def leading_substrings(str)
  arr = []
  0.upto(str.length-1) do |index|
    arr << str[0..index]
  end
  arr
end

def all_substrings(str)
  substrings = []
  0.upto(str.length - 1) do |index|
    substrings << leading_substrings(str[index..])
  end
  substrings.flatten
end

p all_substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]