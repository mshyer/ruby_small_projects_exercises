=begin
[[0, 0, 1],
 [0, 1, 2],
 [2, 1, 0]]

We want our function to return:

-1 if the board is not yet finished AND no one has won yet (there are empty spots),
1 if "X" won,
2 if "O" won,
0 if it's a cat's game (i.e. a draw).
You may assume that the board passed in is valid in the context of a game of Tic-Tac-Toe.

Input: 3 arrays
Output: either -1, 0, 1 or 2

Data structure: 
Algorithm: 
1. for each of the input arrays, check if ALL values are 1 
  a. return 1 if true
2. for each of the input arrays, check if ALL values are 2
  a. return 2 if true
3. 0.upto(2) times |idx|
  a. if ALL of the arrays at idx1 == 1
    return 1 if true
  b. ALL of the arrays at idx1 == 2?
    return 2 if true
4. check diagonals
  LEFT TO RIGHT
  new_arr = []
  a. 3 times |idx|
  a. new_arr << GAMEBOARD[index][index]
  check if the array are 1 or 2s
  RIGHT TO LEFT
  new arr = []
  arr.reverse_each do |sub_arr, idx|
    new arr << sub_arr[idx]
    checl if they are all 1s or 2s
5. return 0 if (arr1 + arr2 + arr3) doesn't contain 0
6. else return -1
=end

def state(board)
  board.each do |sub_arr|
    if sub_arr.all? {|ele| ele == 1}
      return 1
    elsif sub_arr.all? {|ele| ele == 2}
      return 2
    end
  end
  #Check up down
  3.times do |idx|
    if board.all? {|ele| ele[idx] == 1}
      return 1
    elsif board.all? {|ele| ele[idx] == 2}
      return 2
    end
  end
  #check left diagonal
  new_arr = []
  3.times do |idx|
    new_arr << board[idx][idx]
  end
  if new_arr.all? {|ele| ele == 1}
    return 1
  elsif new_arr.all? {|ele| ele == 2}
    return 2
  end
  #check right diagonal
  new_arr = []
  board.reverse_each.with_index do |sub_arr, idx|
    new_arr << sub_arr[idx]
  end
  if new_arr.all? {|ele| ele == 1}
    return 1
  elsif new_arr.all? {|ele| ele == 2}
    return 2
  end
   if !(board[0] + board[1] + board[2]).include?(0) 
    return -1
   end
  return 0
end

p state([[1, 6, 1],
[6, 2, 2],
[2, 1, 2]])