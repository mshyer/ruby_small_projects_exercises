numbers = {
  high:   100,
  medium: 50,
  low:    10
}
half_numbers = []
numbers.map do |item, value|
  puts "a #{item} number is #{value}"
  half_numbers << value/2
end

p half_numbers

select_numbers = numbers.select{|key, value| value < 25}
p select_numbers