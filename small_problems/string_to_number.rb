
DIGITS = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4,
  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9
}
p DIGITS


def string_to_integer(number_string)
  number_arr = number_string.chars.map { |char| DIGITS[char] }
  new_number = 0
  counter = 0
  number_arr.each do |item|
    new_number += (item * 10**((number_arr.length-1 - counter)))
    counter += 1
  end
  
  new_number

end

def string_to_signed_integer(number_string)
  unsigned_string = number_string.slice(1..)
  if number_string[0] == "-"
    -(string_to_integer(unsigned_string))
  elsif number_string[0] == "+"
    string_to_integer(unsigned_string)
  else
    string_to_integer(number_string)
  end
end

def integer_to_string(int)
  digit_arr = int.abs.digits.reverse
  str = ""
  digit_arr.each do |digit|
    str << DIGITS.key(digit)
  end
  str.prepend("-") if int.negative?
  str
end

p integer_to_string(-500)

# p string_to_signed_integer('-4321') == -4321
# p string_to_signed_integer('570') == 570
# p string_to_signed_integer('+570') == 570