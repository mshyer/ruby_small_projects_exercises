# Build a program that asks a user for the length and width of a room in 
# meters and then displays the area of the room in both square meters and square feet.
# Note: 1 square meter == 10.7639 square feet
# Do not worry about validating the input at this time.

def sq_meters_to_ft(number)
  (number * 10.7639).round(2)
end

puts "Please enter the length of the room in meters"
length = gets.chomp.to_i

puts "Please enter the width of the room in meters"
width = gets.chomp.to_i

area_in_meters = (length * width).to_f

puts "The area in sq meters is #{area_in_meters}."
puts "The area in sq feet is #{sq_meters_to_ft(area_in_meters)}"