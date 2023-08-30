def rotate_array(array)
  array[1..] + [array[0]]
end

def max_rotation(number)
  recursive_rotation(number).to_i
end

def recursive_rotation(number)
  a = ''
  number_string = number.to_s
  rotated_string = number_string[1..] + number_string[0]
  a << rotated_string[0]
  if rotated_string.length > 1
    a << recursive_rotation(rotated_string[1..])
  end
  a
end

def rotate_rightmost_digits(number, index)
  number_string = number.to_s
  a, b = number_string.slice(0..-(index + 1)), number_string.slice(-index..)
  (a + rotate_number_string(b)).to_i
end

# def max_rotation(number)
#   index = 0
#   number_string = number.to_s
#   while index < number_string.length
#     number_string = rotate_number_string(number_string)
# end

# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845