=begin
6 rows 7 columns
  A B C D E F G 
6
5
4
3
2
1
Input: array of strings (moves)
Output: strings "Yellow" "Red" or "Draw"

Data structure: Nested array representing rows/columns
Red = 1
Yellow = 2
Empty = 0

   A B C D E F G
[  
  [0 0 0 0 0 0 0] (0)
  [0 0 0 0 0 0 0] (1)
  [0 0 0 0 0 0 0] (2)
  [0 0 0 0 0 0 0] (3)
  [0 0 0 0 0 0 0] (4)
  [0 0 0 0 0 0 0] (5)
]
moves_hash = {A [0]B C D E F G}
pieces_position_list = ["A_Red",
                          "B_Yellow",
                          "A_Red",
                          "B_Yellow",
                          "A_Red",
                          "B_Yellow",
                          "G_Red",
                          "B_Yellow"]

Algorithm:
PIECES ARR [A B C D E F G]
1. set game board
2. iterate through the input array, setting pieces
  a. SEPARATE METHOD (convert the string into a valid move)
      -returns color, column
    1.  column = Str.char
    2. color = 0
    3. str.include?("Red") ? color = 1 : color = 2
    which arr?
  b. board.reverse_each do |row|
      if row[PIECES.index(column)] != 0
        next
      else row[PIECES.index(column)] = color
  3. read board AFTER EACH MOVE COME BACK !!!!!!!!!!
    a. check columns 
    b. check rows
    c. check diagonals

=end

PIECES = ["A", "B", "C", "D", "E", "F", "G"]
#L/R
LR_DIAGONALS = [
[[0,0]],
[[1,0], [0,1]],
[[2,0], [1,1], [0,2]],
[[3,0], [2,1], [1,2], [0,3]],
[[4,0], [3,1], [2,2], [1,3], [0,4]],
[[5,0], [4,1], [3,2], [2,3], [1,4],[0,5]],
[[5,1], [4,2], [3,3], [2,4], [1,5],[0,6]],
[[5,2], [4,3], [3,4], [2,5], [1,6]],
[[5,3], [4,4], [3,5], [2,6]],
[[5,4], [4,5], [3,6]],
[[5,5], [4,6]],
[[5,6]]
]
#R/L
RL_DIAGONALS = [
[[0, 6]],
[[0, 5], [1, 6]],
[[0, 4], [1, 5], [2, 6]],
[[0, 3], [1, 4], [2, 5], [3, 6]],
[[0, 2], [1, 3], [2, 4], [3, 5], [4, 6]],
[[0, 1], [1, 2], [2, 3], [3, 4], [4, 5], [5, 6]],
[[0, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5]],
[[1, 0], [2, 1], [3, 2], [4, 3], [5, 4]],
[[2, 0], [3, 1], [4, 2], [5, 3]],
[[3, 0], [4, 1], [5, 2]],
[[4, 0], [5, 1]],
[[5, 0]]
]

def generate_empty_board()
  board = [  
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0]
        ]
  board
end

def who_is_winner(pieces_position_list)
  board = generate_empty_board
  column = 0
  color = 0
  winner = nil
  valid_moves_arr = pieces_position_list.map do |move|
    column, color = return_valid_move(move)
    [column, color]
  end
  valid_moves_arr.each do |move|
    board.reverse_each do |row|
      next if row[move[0]] != 0
      row[move[0]] = move[1]
      break
    end
    break if !!check_winner(board)
  end
  board.each {|row| p row}
  result = check_winner(board)
  if result == false 
    return "Draw"
  else return result
  end
end

def return_valid_move(move_string)
  column = PIECES.index(move_string.chr)
  color = move_string.include?("Red") ? 1 : 2
  return column, color
end

def columns_to_rows(board)
  index = 0
  output = []
  loop do
    new_row = []
    board.each do |row|
      new_row << row[index]
    end
    output << new_row
    index += 1
    break if index == board[0].length
  end
  output
end

def columns_to_diagonals(board)
end

def check_winner(board)
  #rows
  #array join contains 1111 or 2222?
  board.each do |row|
    return "Red" if row.join("").include?("1111")
    return "Yellow" if row.join("").include?("2222")
  end
  #columns
  reverse_board = columns_to_rows(board)
  reverse_board.each do |row|
    return "Red" if row.join("").include?("1111")
    return "Yellow" if row.join("").include?("2222")
  end
  #diagonals
    LR_DIAGONALS.each do |diag|
      board_diag = diag.map do |coord|
        board[coord[0]][coord[1]]
      end
      return "Red" if board_diag.join("").include?("1111")
      return "Yellow" if board_diag.join("").include?("2222")
    end

    RL_DIAGONALS.each do |diag|
      board_diag = diag.map do |coord|
        board[coord[0]][coord[1]]
      end
      return "Red" if board_diag.join("").include?("1111")
      return "Yellow" if board_diag.join("").include?("2222")
    end
  false
end


p 
# index = 0
# lr_diagonal_coords.each do |diag|
#   diag.each do |coord|
#     board[coord] = index
#   end
# index += 1
# end
# p board


p who_is_winner(["A_Red",
"B_Yellow",
"A_Red",
"B_Yellow",
"A_Red",
"B_Yellow",
"G_Red",
"B_Yellow"])

p who_is_winner(["A_Red",
"B_Red",
"A_Red",
"B_Red",
"A_Red",
"B_Red",
"G_Red",
"B_Red"])

p who_is_winner([
  "C_Yellow",
  "E_Red",
  "G_Yellow",
  "B_Red",
  "D_Yellow",
  "B_Red",
  "B_Yellow",
  "G_Red",
  "C_Yellow",
  "C_Red",
  "D_Yellow",
  "F_Red",
  "E_Yellow",
  "A_Red",
  "A_Yellow",
  "G_Red",
  "A_Yellow",
  "F_Red",
  "F_Yellow",
  "D_Red",
  "B_Yellow",
  "E_Red",
  "D_Yellow",
  "A_Red",
  "G_Yellow",
  "D_Red",
  "D_Yellow",
  "C_Red"])


  p who_is_winner(["A_Red", "B_Yellow", "A_Red", "E_Yellow", "F_Red", "G_Yellow", "A_Red", "G_Yellow"])