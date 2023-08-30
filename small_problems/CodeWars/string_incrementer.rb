=begin
Attention: If the number has leading zeros the amount of digits should be considered.
Problem: function creates a new string with 1 added to the end of the number. It increments any existing number
  -leading zeros considered
Data structure: Arrays
Algorithm:
a. create empty digits array
b. create empty zeros array
1. create a chars array
2. create a duplicate chars array
3. iterate through the first array in reverse
  a. if digit, shift the second array to digits array
  b. if not digit, BREAK
4. iterate through the digits array
  a. if zero and  not the end of index-1, add "0"" to zero array
    b. if not, break
5. convert the digits array into integer and increment by 1
6. join all together as strings.

=end


DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def increment_string(input)
  digits = []
  chars = input.chars
  dup = chars.dup
  chars.reverse_each do |char|
    if DIGITS.include?(char)
      digits.unshift dup.pop
    else
      break
    end
  end
  chars = dup.join("")
  iterated = (digits.join("").to_i + 1).to_s
  p chars + sprintf("%#0#{digits.length}d", iterated)
end


#test cases
increment_string("foo") #== "foo1"
increment_string("foo0042") #== "foo0043"
increment_string("foo9") #== "foo10"
increment_string("foo099") #== "foo100"
increment_string("foo01") #== "
