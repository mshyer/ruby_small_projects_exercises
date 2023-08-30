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

def palindrome?(str)
  clean_str = str.delete('^a-zA-Z0-9') 
  clean_str == clean_str.reverse && clean_str.size > 1
end

def palindromes(str)
  p all_substrings(str).select{ |str| palindrome?(str) }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]