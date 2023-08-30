#input array of numbers
#output original array mutated so that each value is doubled 

def double_numbers!(array)
  for i in 0..(array.length-1)
    if i.odd?
      array[i] = array[i]* 2
    end
  end
  array
end

def multiply_numbers!(array, multiplier)
  for i in 0..(array.length-1)
    array[i] *= multiplier rescue "please enter a valid multiplier"
  end
  array
end

array = [1, 2, 3, 4, 5, 6 ,7 ,8, 9, 10]
# puts array
# double_numbers!(array)
# puts array

puts multiply_numbers!(array, 7)
