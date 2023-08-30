# A tic tac toe board in Ruby!
#require 'pry'
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8]] +  # rows
                [[0, 3, 6], [1, 4, 7], [2, 5, 8]] +  # columns
                [[0, 4, 8], [2, 4, 6]]               # diagonals

# rubocop:disable Metrics/AbcSize
def draw_board(brd1)
  puts "     |     |"
  puts "  #{brd1[0]}  |  #{brd1[1]}  |  #{brd1[2]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd1[3]}  |  #{brd1[4]}  |  #{brd1[5]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd1[6]}  |  #{brd1[7]}  |  #{brd1[8]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def move_valid?(move, moves_array)
  if move.to_i == 0
    puts "INVALID MOVEs"
    return false
  end
  if moves_array[move.to_i - 1] != " "
    puts "INVALID MOVE"
    false
  else
    true
  end
end

def player_move(random_array, moves_array, chosen_player_moves_array = [], available_moves_array, player)
  user_input_move = ""
  if player == "Human"
    loop do
      user_input_move = gets.chomp
      if move_valid?(user_input_move, moves_array)
        break
      end
    end
    moves_array[(user_input_move.to_i - 1)] = "X"
    random_array.delete(user_input_move.to_i)
    chosen_player_moves_array << user_input_move.to_i
    available_moves_array.delete(user_input_move.to_i)
  end

  if player == "Computer"
    if available_moves_array.include?(5)
      moves_array[4] = "O"
      available_moves_array.delete(5)
      random_array.delete(5)
    elsif !random_array.empty? && !ai_detect_threat(moves_array) && !ai_detect_win(moves_array)
      comp_rando_move = random_array.shift
      moves_array[comp_rando_move - 1] = "O"
      available_moves_array.delete(comp_rando_move)
    elsif ai_detect_win(moves_array)
      ai_move = ai_detect_win(moves_array)
      moves_array[ai_move] = "O"
      available_moves_array.delete(ai_move + 1)
      random_array.delete(ai_move + 1)
    else 
      ai_move = ai_detect_threat(moves_array)
      moves_array[ai_move] = "O"
      available_moves_array.delete(ai_move + 1)
      random_array.delete(ai_move + 1)
    end
  end
end

def board_full?(brd)
  !brd.include?(" ")
end

def someone_won?(brd)
  !!detect_winner(brd)
end

# rubocop:disable Metrics/AbcSize
def ai_detect_threat(brd)
  WINNING_LINES.each do |line|
    threat_array = []
    neutral_array = []
    line.each do |index|
      if brd[index] == PLAYER_MARKER 
        threat_array << index
      elsif brd[index] == COMPUTER_MARKER
        next
      else 
        neutral_array << index
      end
      if threat_array.length == 2 && neutral_array.length == 1
        return neutral_array[0]
      end
    end
  end
  nil
end

def ai_detect_win(brd)
  WINNING_LINES.each do |line|
    win_array = []
    neutral_array = []
    line.each do |index|
      if brd[index] == COMPUTER_MARKER 
        win_array << index
      elsif brd[index] == PLAYER_MARKER
        next
      else 
        neutral_array << index
      end
      if win_array.length == 2 && neutral_array.length == 1
        return neutral_array[0]
      end
    end
  end
  nil
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

def joinor(moves_array, delimiter =', ', word ='or')
  case moves_array.size
  when 0 then ''
  when 1 then moves_array.first
  when 2 then moves_array.join(" #{word} ")
  else
    moves_array[-1] = "#{word} #{moves_array.last}"
    moves_array.join(delimiter)
  end
end

def alternate_player(current_player)
  if current_player == "Human"
    "Computer"
  else
    "Human"
  end
end

def playfirst_neutral_gameflow(available_moves_array, random_moves_array, chosen_moves_array, chosen_player_moves_array, player)
  if player == "Human"
    puts "Player moving first"
    current_player = "Human"
  else puts "Computer moving first."
    current_player = "Computer"
  end
  loop do 
    draw_board(chosen_moves_array)
    player_move(random_moves_array, chosen_moves_array, chosen_player_moves_array = [], available_moves_array, current_player)
    current_player =alternate_player(current_player)
    break if someone_won?(chosen_moves_array) || board_full?(chosen_moves_array)
  end
end

# rubocop:enable Metrics/AbcSize

player_score = 0
computer_score = 0

## MAIN GAME LOOP
loop do
  chosen_moves_array = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  chosen_player_moves_array = []
  random_moves_array = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffle
  available_moves_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  puts "Welcome to Tic Tac Toe! First to 3 wins!"
  puts "Would you like to go first or second or random? or Random (ENTER 1 2 3)?"
  move_order_input = gets.chomp

  case move_order_input.to_i
  when 1
    playfirst_neutral_gameflow(available_moves_array, random_moves_array, chosen_moves_array, chosen_player_moves_array, "Human")
  when 2
    playfirst_neutral_gameflow(available_moves_array, random_moves_array, chosen_moves_array, chosen_player_moves_array, "Computer")
  when 3
    random_choice = rand(2)
    playfirst_neutral_gameflow(available_moves_array, random_moves_array, chosen_moves_array, chosen_player_moves_array, "Human") if random_choice == 0
    playfirst_neutral_gameflow(available_moves_array, random_moves_array, chosen_moves_array, chosen_player_moves_array, "Computer") if random_choice == 1
  else 
    puts "invalid input"
    next
  end

  draw_board(chosen_moves_array)

  if someone_won?(chosen_moves_array)
    puts "the #{detect_winner(chosen_moves_array)} won"
    case detect_winner(chosen_moves_array)
    when 'Player' then  player_score += 1
    when 'Computer' then computer_score += 1
    end
  else
    puts "it's a draw!"
  end
  puts "The score is Player: #{player_score}; Computer, #{computer_score}"
  if player_score == 3
    puts "CONGRATS!"
    break
  elsif computer_score == 3
    puts "Better luck next time!"
    break
  end

  
end
puts "thank you for playing tic tac toe!"

#DELETED REDUNDANT WORKING CODE 
# def user_move(random_array, moves_array, chosen_player_moves_array, available_moves_array)
#   user_input_move = ""
#   loop do
#     user_input_move = gets.chomp
#     if move_valid?(user_input_move, moves_array)
#       break
#     end
#   end
#   moves_array[(user_input_move.to_i - 1)] = "X"
#   random_array.delete(user_input_move.to_i)
#   chosen_player_moves_array << user_input_move.to_i
#   available_moves_array.delete(user_input_move.to_i)
# end

# def comp_move(random_array, moves_array, available_moves_array)
#   if available_moves_array.include?(5)
#     moves_array[4] = "O"
#     available_moves_array.delete(5)
#     random_array.delete(5)
#   elsif !random_array.empty? && !ai_detect_threat(moves_array) && !ai_detect_win(moves_array)
#     comp_rando_move = random_array.shift
#     moves_array[comp_rando_move - 1] = "O"
#     available_moves_array.delete(comp_rando_move)
#   elsif ai_detect_win(moves_array)
#     ai_move = ai_detect_win(moves_array)
#     moves_array[ai_move] = "O"
#     available_moves_array.delete(ai_move + 1)
#     random_array.delete(ai_move + 1)
#   else 
#     ai_move = ai_detect_threat(moves_array)
#     moves_array[ai_move] = "O"
#     available_moves_array.delete(ai_move + 1)
#     random_array.delete(ai_move + 1)
#   end
# end

# def player_first_game(available_moves_array, random_moves_array, chosen_moves_array, chosen_player_moves_array)
#   puts "Player moving first"
#   loop do
#     puts "please enter your move #{joinor(available_moves_array.clone)}"
#     player_move(random_moves_array, chosen_moves_array, chosen_player_moves_array, available_moves_array, "Human")
#     break if someone_won?(chosen_moves_array) || board_full?(chosen_moves_array)
#     player_move(random_moves_array, chosen_moves_array, available_moves_array, "Computer")
#     #binding.pry
#     draw_board(chosen_moves_array)
#     break if someone_won?(chosen_moves_array) || board_full?(chosen_moves_array)
#   end
# end

# def computer_first_game(available_moves_array, random_moves_array, chosen_moves_array, chosen_player_moves_array)
#   puts "Computer moving first"
#   loop do
#     player_move(random_moves_array, chosen_moves_array, available_moves_array, "Computer")
#     draw_board(chosen_moves_array)
#     break if someone_won?(chosen_moves_array) || board_full?(chosen_moves_array)
#     puts "please enter your move #{joinor(available_moves_array.clone)}"
#     player_move(random_moves_array, chosen_moves_array, chosen_player_moves_array, available_moves_array, "Human")
#     break if someone_won?(chosen_moves_array) || board_full?(chosen_moves_array)
#     #binding.pry
#     draw_board(chosen_moves_array)
#     #binding.pry
#   end
# end
