WINNING_LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                 [0, 3, 6], [1, 4, 7], [2, 5, 8],
                 [0, 4, 8], [2, 4, 6]]

class Board
  attr_accessor :squares, :player_mark

  def initialize
    @squares = {}
    @player_mark = nil
    init_squares
  end

  def reset
    init_squares
  end

  def init_squares
    9.times do |i|
      squares[i] = Square.new
    end
  end

  def print_empty_squares
    if empty_squares.length == 1
      puts "Available squares: #{empty_squares[0]}"
    else
      puts "Available squares: #{empty_squares[0..-2].join(', ')} and #{empty_squares[-1]}"
    end
  end

  # def self.empty_squares
  #   empty_squares = squares.select do |_, value|
  #     value.mark == " "
  #   end
  #   empty_squares.keys.map { |num| num + 1 }
  # end

  def set_mark(square, marker)
    self[square] = marker
  end

  def []=(num, marker)
    squares[num].mark = marker
  end

  def marks
    squares.values.map(&:mark)
    # { |square| square.mark }
  end

  def empty_squares
    empty_squares = squares.select do |_, value|
      value.mark == " "
    end
    empty_squares.keys.map { |num| num + 1 }
  end

  def empty_indexes
    empty_squares.map {|square| square - 1}
  end

  def full?
    empty_squares.empty?
  end

  def clear
    system 'clear'
  end

  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |     "
    display_squares(0)
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    display_squares(3)
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    display_squares(6)
    puts "     |     |     "
  end
  # rubocop:enable Metrics/MethodLength

  def display_squares(n)
    puts "  #{squares[n]}  |  #{squares[n + 1]}  |  #{squares[n + 2]}  "
  end

  def game_won?
    !!detect_winner_unlimited_player_symbols
  end

  # def detect_winner
  #   WINNING_LINES.each do |line|
  #     return 1 if line.all? { |idx| squares[idx].mark == "X" }
  #     return 2 if line.all? { |idx| squares[idx].mark == "O" }
  #   end
  #   nil
  # end

def detect_winner_unlimited_player_symbols
  WINNING_LINES.each do |line|
    if line.all? { |idx| squares[idx].mark != "O" } && line.all? { |idx| squares[idx].mark != " " }
       return 1
    elsif  line.all? { |idx| squares[idx].mark == "O" }
      return 2
    end
  end
  nil
end

end


class Square
  DEFAULT_MARK = " "
  attr_accessor :mark

  def initialize
    @mark = DEFAULT_MARK
  end

  def to_s
    mark
  end
end

class Player
  attr_accessor :score
  attr_reader :mark, :name
end

class Computer < Player
  def initialize(human)
    @mark = opposite_mark(human.mark)
    @name = "Computer"
    @score = 0
  end

  def random_choose_mark(board)
    empty_squares = board.squares.select do |_, value|
      value.mark == " "
    end
    #medium_difficulty_move(board)
    p empty_squares.keys
    random_square = empty_squares.keys.sample
    p random_square
    board[random_square] = mark
  end

  def medium_difficulty_move(board)
    if detect_imminent_player_victory(board)
      block_player(board)
    else
      random_choose_mark(board)
    end
    #detect_imminent_player_victory(board)
  end

  def block_player(board)
    imminent_win = WINNING_LINES.select do |line|
      line.count { |idx| board.squares[idx].mark == board.player_mark } == 2 &&
      line.count { |idx| board.empty_indexes.include?(idx) } == 1
    end

    winning_line_empty_spot = imminent_win[0].select { |idx| board.empty_indexes.include?(idx) } 

    board.squares[winning_line_empty_spot[0]].mark = self.mark
    # p imminent_win
    # p board.empty_squares
    # p winning_line_empty_spot
    # p board.squares[winning_line_empty_spot[0]]
  end

  def detect_imminent_player_victory(board)
    imminent_win = WINNING_LINES.select do |line|
      line.count { |idx| board.squares[idx].mark == board.player_mark } == 2 &&
      line.count { |idx| board.empty_indexes.include?(idx) } == 1
    end
    if !imminent_win.empty?
      return true
    end
    nil
    # board[] = mark
    # imminent_win[0]
  end

  def detect_imminent_cpu_victory(board)
    imminent_win = WINNING_LINES.select do |line|
      line.count { |idx| board.squares[idx].mark == mark } == 2 &&
      line.count { |idx| board.empty_indexes.include?(idx) } == 1
    end
    if !imminent_win.empty?
      return true
    end
    nil
  end

  def closer_move(board)
    imminent_win = WINNING_LINES.select do |line|
      line.count { |idx| board.squares[idx].mark == mark } == 2 &&
      line.count { |idx| board.empty_indexes.include?(idx) } == 1
    end
    winning_line_empty_spot = imminent_win[0].select { |idx| board.empty_indexes.include?(idx) } 
    board.squares[winning_line_empty_spot[0]].mark = self.mark

  end

  def hard_difficulty_move(board)
    if board.empty_squares.include?(5)
      cpu_to_5(board)
      return
    end
    if detect_imminent_cpu_victory(board)
      closer_move(board)
    elsif detect_imminent_player_victory(board)
      block_player(board)
    else
      random_choose_mark(board)
    end
  end

  def cpu_to_5(board)
    board.squares[4].mark = self.mark
  end

  private

  def opposite_mark(other_mark)
    other_mark == "O" ? "X" : "O"
  end
end

class Human < Player
  def initialize
    @name = set_name
    @mark = set_mark
    @score = 0
  end

  def choose_mark(board)
    square = ''
    loop do
      board.print_empty_squares
      square = gets.chomp.to_i
      break if board.empty_squares.include?(square)
      puts "Please choose a valid square"
    end
    square -= 1
    board[square] = mark
  end

  private

  def set_name
    name = ""
    puts "Please enter your name"
    loop do
      name = gets.chomp
      break unless name.empty?
      puts "Please enter a valid name."
    end
    name
  end

  def set_mark
  #   mark = ""
  #   puts "Please choose a mark, enter [X] or [O]"
  #   loop do
  #     mark = gets.chomp.upcase
  #     break unless !["X", "O"].include?(mark)
  #     puts "Invalid choice"
  #   end
  #   mark
  # end
  set_any_mark
end

def set_any_mark
  mark = ""
  puts "Please choose a mark, enter [X] or [O] or press any key for non-traditional symbol"
  loop do
    mark = gets.chomp.upcase
    break unless mark.length != 1
    puts "Invalid choice"
  end
  mark
end
end

# Orchestration Engine
class TTTGame
  attr_reader :p1, :p2, :board
  attr_accessor :play_again_message_toggle

  FIRST_TO_MOVE = :Human
  def initialize
    @p1 = Human.new
    @p2 = Computer.new(p1)
    @board = Board.new()
    @play_again_message_toggle = false
    @current_player = FIRST_TO_MOVE
  end

  def play
    loop do
      greet_player
      board.player_mark = p1.mark
      whos_on_first
      main_game_loop
      puts winner_message
      break unless play_again?
      reset_game
    end
    goodbye
  end

  private

  def reset_game
    board.reset
    @current_player = FIRST_TO_MOVE
  end

  def whos_on_first
    puts "Would you like to go first or second? [1] First [2] Second"
    answer = 0
      loop do 
        answer = gets.chomp.to_i
        break unless ![1, 2].include?(answer)
        puts "Invalid choice"
      end
      @current_player = answer == 1 ?  :Human : :Computer
  end

  def main_game_loop
    loop do
      display_board
      play_again_message
      current_player_move
      break if board.game_won? || board.full?
    end
    display_board
    increment_score
    puts "Game complete"
  end

  def increment_score
    answer = board.detect_winner_unlimited_player_symbols
    if answer == 1
      p1.mark != "O" ? p1.score += 1 : p2.score += 1
    elsif answer == 2
      p1.mark == "O" ? p1.score += 1 : p2.score += 1
    end
  end

  def current_player_move
    if @current_player == :Human
      p1.choose_mark(board)
      @current_player = :Computer
    else
      p2.hard_difficulty_move(board)
      #p2.random_choose_mark(board)
      @current_player = :Human
    end
  end

  def winner_message
    answer = board.detect_winner_unlimited_player_symbols
    if answer.nil?
      "It's a tie!"
    elsif answer == 1
      p1.mark != "O" ? ("#{p1.name} won!") : "#{p2.name} won!"
    else
      p1.mark == "O" ? ("#{p1.name} won!") : "#{p2.name} won!"
    end
  end

  def greet_player
    puts "Hello #{p1.name}. Welcome to Tic Tac Toe."
    puts "You have chosen #{p1.mark}. The Computer is playing #{p2.mark}."
  end

  def goodbye
    puts "Thanks for playing Tic Tac Toe!"
  end

  def play_again_message
    puts "let's play again!\n " if play_again_message_toggle
    self.play_again_message_toggle = false
  end

  def display_board
    board.clear
    puts "You're #{p1.mark}. Computer is #{p2.mark}"
    puts ""
    board.draw
    puts "current score: #{p1.name}: #{p1.score}, #{p2.name}: #{p2.score}"
    puts ""
  end

  def play_again?
    puts "Would you like to play again?(y/n)"
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if ["y", "n"].include?(answer)
      puts "must enter y or n"
    end
    self.play_again_message_toggle = true if answer == 'y'
    answer == 'y'
  end
end

TTTGame.new.play
# Square.new
