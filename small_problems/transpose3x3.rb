matrix = [2,3,4,4,5
  # [1, 5, 8]
  #[4, 7, 2]
  # [3, 9, 6]
]


def transpose(matrix)
  result = []
  rows = (matrix.length) - 1
  columns = matrix[0].length - 1
  (0..columns).each do |column|
    new_row = (0..rows).map { |row| matrix[row][column]}
    result << new_row
  end
  p result
end

# def transpose(matrix)
#   new_arr = []
#   index = 0
#   loop do
#     new_arr << []
#     matrix.each do |arr|
#       new_arr[index] << arr[index]
#     end
#     index += 1
#     break if index == matrix.first.length
#   end
#   p new_arr
# end



new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]