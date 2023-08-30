car = {type: "sedan", color: "blue", mileage: 80_000}
puts car

car[:year] = 3002
puts car

car.delete(:mileage)
puts car

puts car[:color]