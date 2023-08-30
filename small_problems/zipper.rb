def zip(arr1, arr2)
  output = []
  i = 0
  loop do
    output << [arr1[i], arr2[i]]
    i += 1
    break if i == arr1.length || i == arr2.length
  end
  output
end

p zip([1, 2, 3], [4, 5, 6, 7]) == [[1, 4], [2, 5], [3, 6]]