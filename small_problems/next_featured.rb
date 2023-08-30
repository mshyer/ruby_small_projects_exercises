def unique_digits?(n)
  n.to_s.chars.uniq == n.to_s.chars
end
987654321
def featured(int)
  featured = [7]
  return "number too large" if int >= 9876543210
  n = int - (int % 7)
  loop do
    n += 7
    featured << n if n.odd? && unique_digits?(n)
    break if featured[-1] > int || featured[-1] > 9876543210
  end
  featured[-1]
end



p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements