=begin
method returns a string represented a number in "expanded form". 32 is "30 + 2"
61250 should be "60000 +1000 + 200 + 50"
600000 should be 600000
6 million should be 6 milliob
NOTE: each digit represents a new unit. tens, hundreds, thousands, ten thousands. 60000 is 6 plus 4 zeros
data structure: array
Algorithm:

Data structure: array of digits

Algorithm:
1. convert number into array of digits (reversed)
2. map arr of digits with index. Multiply times 10**index  531 -- 123 1 * 10 0 3 * 10 5 * 10^2
3. reverse array, remove 0s.
4. Join with pluses
=end

def expanded_form(int)
  digits_reversed = int.digits
  output_arr = digits_reversed.map!.with_index {|digit, idx| digit * 10**idx}
  output_arr.reverse!.select! {|num| num != 0}
  output_arr.join(" + ")
end

p expanded_form(567)