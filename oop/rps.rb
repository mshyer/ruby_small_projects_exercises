require 'io/console'

module ConsoleControls
  def self.continue
    puts "Press any key to continue"
    STDIN.getch
  end
end

class Player
  include ConsoleControls
  attr_accessor :hand, :name, :score, :moves_tracker

  HANDS = ["rock", "paper", "scissors", "spock", "lizard"]
  def initialize(name = "Player")
    @hand = nil
    @name = name
    @score = 0
    @moves_tracker = []
  end

  def which_object(throw)
    case throw
    when "spock" then Spock.new(throw)
    when "lizard" then Lizard.new(throw)
    when "rock" then Rock.new(throw)
    when "paper" then Paper.new(throw)
    when "scissors" then Scissors.new(throw)
    end
  end
end

class Human < Player
  def initialize
    super
    set_name
  end

  def set_name
    system 'clear'
    puts "Please enter your name"
    user_input = gets.chomp
    self.name = user_input
    system 'clear'
    print_welcome_message
  end

  def print_welcome_message
    puts "Hello #{name}, welcome to Rock Paper Scissors Spock Lizard!"
    puts "First player to three wins"
    ConsoleControls.continue
  end

  def choose
    loop do
      puts "please enter rock, paper, scissors, spock or lizard."
      user_choice = gets.chomp.downcase
      if HANDS.include?(user_choice)
        @hand = which_object(user_choice)
        @moves_tracker << @hand.throw
        break
      end
      puts "sorry that wasn't a valid response"
    end
  end
end

class Computer < Player
  def initialize
    super
    set_name
  end

  def speak
    "#{name} says: "
  end

  def self.choose_computer
    user_input = ''
    system 'clear'
    loop do
      puts "Please choose an opponent:(enter ABCDE)"
      puts "[A:] R2D2 [B:] Hal9000 [C:] Bender [D:] C3P0 [E:] Random "
      user_input = gets.chomp.downcase
      break if %w(a b c d e).include?(user_input)
      puts "invalid input. Please enter ABCDE"
    end
    assign_computer(user_input)
  end

  def self.assign_computer(choice)
    case choice
    when "a" then R2D2.new()
    when "b" then Hal9000.new()
    when "c" then Bender.new()
    when "d" then C3P0.new()
    when "e" then COMPUTERS.sample.new()
    end
  end

  def to_s
    name
  end

  def choose(_)
    @hand = which_object(HANDS.sample)
    @moves_tracker << @hand.throw
  end

  def set_name
    self.name = ["R2D2", "C3P0", "Hal 9000", "Bender"].sample
  end
end

class R2D2 < Computer
  # High chance of choosing parts that can be sold for scrap
  def choose(_)
    a = rand(1..6)
    @hand =
      if a != 1
        which_object(["scissors", "paper", "rock"].sample)
      else
        which_object(["spock", "lizard"].sample)
      end
    @moves_tracker << @hand.throw
  end

  def speak
    puts super + "*incomprehensible beeps and whirrs*"
    puts "Hmmm... he seems to like scrap\n "
  end

  def set_name
    self.name = "R2D2"
  end
end

class C3P0 < Computer
  # High chance of choosing moves of "equally high intellect" to himself.
  # Insists that lizards are seen as highly intelligent in most of the galaxy.
  def speak
    puts super + "'No, no, this is all most improper!'"
    puts "C3P0 favors choices of high intellect.\n "\
    "(He has a questionable understanding of lizards)\n "
  end

  def choose(_)
    a = rand(1..6)
    @hand =
      if a != 1
        which_object(["spock", "lizard"].sample)
      else
        which_object(["scissors", "paper", "rock"].sample)
      end
    @moves_tracker << @hand.throw
  end

  def set_name
    self.name = "C3P0"
  end
end

class Hal9000 < Computer
  # Has a 2/3ds chance of cheating
  def speak
    puts super + "'I'm afraid I can't let you do that'"
    puts "Hal9000 has already calculated your next move\n "
  end

  def choose(human)
    a = rand(1..3)
    @hand =
      if a != 1
        beat_player(human)
      else
        which_object(HANDS.sample)
      end
    @moves_tracker << @hand.throw
  end

  def beat_player(human)
    case human.hand.throw
    when "rock", "spock"
      Paper.new("paper")
    when "paper", "lizard"
      Scissors.new("scissors")
    when "scissors"
      Rock.new("rock")
    end
  end

  def set_name
    self.name = "Hal9000"
  end
end

class Bender < Computer
  # will play anything

  def speak
    puts super + "'Hey sexy mama. Wanna kill all humans?'\n "
  end

  def set_name
    self.name = "Bender"
  end
end

class Hand
  attr_reader :throw

  def initialize(throw)
    @throw = throw
  end

  def to_s
    @throw
  end
end

class Rock < Hand
  def beats?(other)
    other.throw == "scissors" || other.throw == "lizard"
  end
end

class Paper < Hand
  def beats?(other)
    other.throw == "spock" || other.throw == "rock"
  end
end

class Scissors < Hand
  def beats?(other)
    other.throw == "lizard" || other.throw == "paper"
  end
end

class Spock < Hand
  def beats?(other)
    other.throw == "rock" || other.throw == "scissors"
  end
end

class Lizard < Hand
  def beats?(other)
    other.throw == "spock" || other.throw == "paper"
  end
end

# Game orchestration engine

COMPUTERS = [R2D2, Hal9000, Bender, C3P0]

class RPSGame
  attr_accessor :human, :computer

  include ConsoleControls

  def initialize
    @human = Human.new()
    @computer = Computer.choose_computer
  end

  def play
    puts "Welcome to the game #{human.name}."
    main_game_loop
    puts "goodbye!"
  end

  def main_game_loop
    loop do
      rock_paper_scissors_shoot
      process_score
      if game_complete?
        break unless play_again?
        reset_game_state
      end
    end
  end

  def reset_game_state
    reset_scores
    self.computer = Computer.choose_computer
    human.moves_tracker = []
  end

  def reset_scores
    computer.score = 0
    human.score = 0
  end

  def rock_paper_scissors_shoot
    puts "You are playing against #{computer}"
    computer.speak
    human.choose
    computer.choose(human)
  end

  def print_winner
    if human.hand.beats?(computer.hand)
      puts "#{human.name} won!"
    elsif computer.hand.beats?(human.hand)
      puts "#{computer.name} won!"
    else
      puts "It's a draw!"
    end
  end

  def process_score
    increment_score
    display_winner
  end

  def increment_score
    if human.hand.beats?(computer.hand)
      human.score += 1
    elsif computer.hand.beats?(human.hand)
      computer.score += 1
    end
  end

  def game_complete?
    human.score == 3 || computer.score == 3
  end

  def who_won
    return human.name if human.score == 3
    return computer.name if computer.score == 3
  end

  def display_winner
    system 'clear'
    print_throws
    print_current_scores
    print_winner
    review_previous_moves?
    print_final_winner if game_complete?
  end

  def print_final_winner
    puts "#{who_won} won the game with a score of 3!",
         "Thanks for playing!"
  end

  def review_previous_moves?
    loop do
      puts "Press any key to continue. (Enter 'H' to review past moves)"
      answer = gets.chomp
      system 'clear'
      break unless answer == 'h'
      if answer == 'h'
        print_previous_moves
        break
      end
    end
  end

  def print_previous_moves
    system 'clear'
    puts "#{human.name}: #{previous_moves(human)}"
    puts "#{computer.name}: #{previous_moves(computer)}"
    ConsoleControls.continue
  end

  def previous_moves(player)
    player.moves_tracker.join(", ")
  end

  def print_throws
    system 'clear'
    puts "#{human.name} played #{human.hand} "\
    "and #{computer.name} played #{computer.hand}"
  end

  def print_current_scores
    puts "Score: #{human.name}: #{human.score} "\
    "#{computer.name}: #{computer.score}"
  end

  def play_again?
    user_input = ""
    loop do
      puts "play again? Y/N"
      user_input = gets.chomp.downcase
      break if user_input == "y" || user_input == "n"
      puts "invalid choice. Please enter Y/N"
    end
    system 'clear'
    user_input == "y"
  end
end

game = RPSGame.new
game.play
