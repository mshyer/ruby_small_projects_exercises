require 'pry'
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

# Create a new nested array, where each element is an array of all the corresponding values at index n for each index
def rotate90(matrix)
  arr = []
  #create an empty sub array for each index
  (0..(matrix[0].length)-1).each do |n|
    arr << []
    matrix.each do |array|
      arr[n] << array[n]
    end
    arr[n] = arr[n].reverse
    #binding.pry
  end
  arr
end


new_matrix1 = rotate90(matrix1)
p new_matrix1
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2