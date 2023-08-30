# Write a method which takes a grocery list (array) of fruits with
# quantities and converts it into an array of the correct number of each fruit.

def buy_fruit(fruit_data)
  cart = []
  fruit_data.each do |arr|
    arr[1].times {cart << arr[0]}
  end
  cart
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]