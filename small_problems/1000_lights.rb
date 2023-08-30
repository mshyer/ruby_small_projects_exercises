require 'pry'
def flip_switches(number_of_switches)
  switches_arr = [false] * number_of_switches
  counter = 1
  loop do
    switches_arr.map!.with_index do |switch, index|
      (index + 1) % (counter) == 0 ? !switch : switch
      end
    counter += 1
    break if counter > number_of_switches
  end
  switches_arr
end

def switches(number)
  boolean_arr = flip_switches(number)
  indices = []
  boolean_arr.each.with_index do |boolean, index|
    if boolean == true
      indices << (index + 1)
    end
  end
  indices
end


p switches(1000)

#ADDITIONAL CODE FROM TEST PREP
=begin
PEDAC: 
write a method that represents switches 1..n that are all connected to a 'light'
a process repeat n times: first turn on all the lights, on second repetion, flip all multiples of 2, then flip 3s, then 4s until n times
so the number of lights and the number of repetitions is the same
returns the switches that are on at the end of the process
Input: integer n
Output: Array of switches with info on switches
__
Data structure: hash of "switches" with value

algorithm:
1. METHOD1: generate a hash of n switches, initialized to all off
  a. initialize empty hash
  b. iterate from 1..n and add each i as key to hash with value false
2. METHOD 2: go through n iterations of the switching process
  a. n times with index
  b. each switches. If switch key % (index + 1) == 0, flip switch 
  
3. return array
  init output array []
  iterate through the hash and if the value is true, append the corresponding key to array
  return array

4. additional exploration: 
  method generates string "1,2,3 and n"
  1. generate 2 arrays of numbers that are off/on
  2. create a new hash that will contain output strings for on/off
  2. convert each element to string
  3. join array[0...-1] into 1 string separated by ", " 
  4. add joined string to "and #{string[-1]}"
  5. combine both strings 
  6. add off and on arrays to output hash and return the output hash
=end



# def generate_switches(n)
#   switches = Hash.new()
#   (1..n).each { |i| switches[i] = false}
#   switches
# end

# def iterate_switches(switches, n)
#   n.times do |idx|
#     switches.each do |key, value|
#       if key % (idx + 1) == 0
#         switches[key] = !value
#       end
#     end
#   end
# end

# def on_switches_arr(switches)
#   output = []
#   switches.each do |key, value|
#     if value == true
#       output << key
#     end
#   end
#   output
# end

# def switches_list_string(switches)
#   output = Hash.new()
#   on = []
#   off = []
#   switches.each do |key, value|
#     value == true ? on << key : off << key
#   end
#   on.map! { |item| item.to_s}
#   off.map! { |item| item.to_s}
#   on_string = "#{on[0...-1].join(", ")} and #{on[-1]}"
#   off_string = "#{off[0...-1].join(", ")} and #{off[-1]}"
#   output[:on] = on_string
#   output[:off] = off_string
#   output
# end

# def thousand_lights(n)
#   switches = generate_switches(n)
#   iterate_switches(switches, n)
#   output_hash = switches_list_string(switches)
#   puts "Switches #{output_hash[:on]} are on. Switches #{output_hash[:off]} are off"
# end
# # a = generate_switches(5)
# # iterate_switches(a, 5)
# # p a

# thousand_lights(5)