def leading_substrings(str)
  arr = []
  0.upto(str.length-1) do |index|
    arr << str[0..index]
  end
  p arr
  # arr = []
  # index = 1
  # loop do
  #   arr << str.slice(0, index)
  #   index += 1
  #   break if index == str.length + 1
  # end
  # arr
end


p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']