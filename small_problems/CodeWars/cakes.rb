=begin
determines how many times Pete can cook a recipe based on his available ingredients in pantry
Input: two hashes of symbols and integers representing ingredients and quantity
Output: integer (how many times possible)
Data structure: array to test against hashes
Agorithm: 
First check if the pantry has all the ingredients
  -if no, return zero
Then check how many "recipes worth" of each item he has in pantry. 
  -The lowest value is the answer

1. init empty array
2. pantry keys.all?
  2. recipe includes key? t/f
  if no, return 0.
3.iterate through recipe keys 
    a. array << pantry[key]/recipe[key]
4. return the lowest value in the array

=end
require 'pry'
def cakes(recipe, pantry)
  arr = []
  return 0 if !recipe.keys.all? { |key| pantry.member?(key) } 
  recipe.keys.each do |key|
    arr << (pantry[key] / recipe[key])
  end
  return arr.min
end

#must return 2
p cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); 
#must return 0
p cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}); 