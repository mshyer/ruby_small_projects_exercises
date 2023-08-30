def include?(arr, search)
  selection = arr.select{ |item| item == search }
  !selection.empty?
end


p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p 
p include?([], nil) == false