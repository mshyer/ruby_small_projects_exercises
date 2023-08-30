=begin
PEDAC
Function takes Roman Numeral (up to 3999) as input and returns the integer value
Symbol    Value
I          1
V          5
X          10
L          50
C          100
D          500
M          1,000

Data structure: using constant, convert string into ARRAY OF INTs
'MMVIII', 2008
MDCLXVI'), 1666
1000 500 100 50
100 500
MCMXIX -> 1000 100 1000 10 1 10
If arr[iterator + 1] is greater than arr[iterator], subtract 0 from 1

Algorithm:
1. init constant of roman numeral values according to chart above
2. Init empty ouput int 0
3. iterate through input strint, converting it into an array of ints
4. loop
  a. break if i >= arr.length
  b. if i == arr.length - 1, output += arr[length - 1]
    break
  c. If arr[i+1] is less than arr[i], arr << arr[i].  (dont appent, add, woops)
    i + 1
  d. if arr[i + 1] is greater than arr[i] output += (arr[i+1]- arr[i])
    i + 2
    return the int
=end
require 'pry'
ROMAN_NUMERALS = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
def roman_to_int(roman)
  p values = roman.chars.map { |char| ROMAN_NUMERALS[char] }
  output = 0
  counter = 0
  loop do
    break if counter >= values.length
    if counter == (values.length - 1)
      output += values[counter]
      break
    end
    if values[counter + 1] <= values[counter]
      output += values[counter]
      counter += 1
    elsif values[counter + 1] > values[counter]
      output += (values[counter + 1] - values[counter])
      counter += 2
    else
      puts "logic error"
    end
  end
  output
end

# roman_to_int("XII")
# roman_to_int("XIV")
# roman_to_int("MCMXIX")

def solution(roman)
  vals = {"M" => 1000, "D" => 500, "C" => 100, "L" => 50, "X" => 10, "V" => 5, "I" => 1}
  binding.pry
  roman.chars.map{|c| vals[c]}.reduce{|a, b| a < b ? b - a : a + b}
end

solution("MCMXIX")