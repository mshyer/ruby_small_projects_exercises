
def split_index(arr)
  arr.length.odd? ? (arr.length / 2) : (arr.length / 2 - 1)
end

def halvsies(arr)
  nested_arr = []
  first_half = split_index(arr)
  nested_arr << arr[0..first_half]
  nested_arr << arr[(first_half+1)..]
  nested_arr
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]