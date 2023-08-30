=begin
Write a method that converts an RGB color to a Hexadecimal color value
Hexadecimal is base 16, RGB base 10.
base 16: [0,1,2,3,4,5,6,7,8,9, A, B, C, D, E, F] 
input: 3 integers 
output: one 6 character string

Data structure: array of hexadecimal digits, appropriate digits calculated using formula

Algorithm: 
1. Initialize constant of base 16 values 0-F
1. for each input, divide input by 16.0(float) and store value
2.THE BELOW STEPS SHOULD BE ONE METHOD. Run this method on each input integer / 16
  2. initialize two variables using divmod(1) on the stored value
  3. append the first variable to output array
  4. second variable, multiply by 16, then append to output array
3. map the output array to correspond to base 16 values 0-F in constant
4. return the joined output array
=end

HEX_VALUES = %w(0 1 2 3 4 5 6 7 8 9 A B C D E F)

def RGB_to_hex(int1, int2, int3)
  output = []
  output << base_10_to_16(int1)
  output << base_10_to_16(int2)
  output << base_10_to_16(int3)
  output.flatten!.map! { |value| HEX_VALUES[value] }
  puts output.join("")

end

def base_10_to_16(int)
  arr = []
  num_sixteen = int / 16.0
  num_sixteen = 0 if int < 0
  a, b = num_sixteen.divmod(1)
  arr << a.to_i
  arr << (b * 16).to_i
  arr
end

RGB_to_hex(0, 0, -20)