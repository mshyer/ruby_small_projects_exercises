#Write a method that counts the number of occurrences of each element in a given array.

# Iterate through array
# Add item to new hash as key unless new hash already includes item. Init value of key to 1
# If hash already includes key, iterate value by 1
# Iterate through hash; print all the keys and their values

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

def count_occurences(array)
  array_hash = {}
  array.each do |item|
    if array_hash.key?(item)
      array_hash[item] += 1
    else array_hash[item] = 1
    end
  end
  array_hash.each do |key, value|
    puts "#{key} => #{value}"
  end
end

count_occurences(vehicles)