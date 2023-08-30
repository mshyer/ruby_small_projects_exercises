##example of mutatin array using method
a = [1, 2, 3]

def mutate_this(array)
  #array.pop
  array.last
  #array[3] = 6
end

p "this is the array before mutate: #{a}"
mutate_this(a)
p "this is the array after mutate: #{a}"

