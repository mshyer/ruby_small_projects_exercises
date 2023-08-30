=begin
Problem:
Make a guessing game where you have 7 tries to guess a number between 1 and 100.
  -If a user guesses high, the game should tell them the guess was high
  -If the user guesses low, the game should say so
  -If the guess is out of range, (below 1 or above 100),
  game should print an error message. Doesn't count as guess
  -You lose if you run out of guesses
  -You win if you guess the number
  Nouns: Guess, Tries, range, User input, Error
=end

module GuessLogic
  def high_or_low(guess)
    if guess < secret_number
      puts "Guess was too low"
    elsif guess > secret_number
      puts "Guess was too high"
    end
  end

  def correct?(guess)
    guess == secret_number
  end
end

class GuessingGame
  include GuessLogic
  attr_accessor :guesses
  attr_reader :lower_guess_limit, :upper_guess_limit

  def initialize(lower_guess_limit = 1, upper_guess_limit = 100)
    @guesses = Math.log2(upper_guess_limit-lower_guess_limit).to_i + 1
    @lower_guess_limit = lower_guess_limit
    @upper_guess_limit = upper_guess_limit
    @secret_number = rand(lower_guess_limit..upper_guess_limit)
  end

  def play
    greet_player
    loop do
      guess = player_guesses
      high_or_low(guess)
      self.guesses -= 1
      next unless correct?(guess) || guesses == 0
      win_or_lose(guess)
      break unless play_again?
      reset
    end
  end

  def win_or_lose(guess)
    if guesses == 0
      puts "Oh no, you ran out of guesses! Better luck next time."
    else
      puts "#{guess} was the correct number. You win!"
    end
  end

  def play_again?
    answer = ''
    loop do
      puts "Do you want to play again? Enter Y/N"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.chr.downcase)
    end
    answer == 'y'
  end

  def reset
    self.guesses = 7
    self.secret_number = rand(lower_guess_limit..upper_guess_limit)
  end

  def greet_player
    puts "Hello, welcome to the guessing game!"
  end

  def player_guesses
    puts "You have #{guesses} guesses remaining"
    guess = ''
    loop do
      puts "Enter a number between #{lower_guess_limit} and #{upper_guess_limit}"
      guess = gets.chomp.to_i
      break if (lower_guess_limit..upper_guess_limit).include?(guess)
      puts "Invalid guess. Enter a number between #{lower_guess_limit} and #{upper_guess_limit}"
    end
    guess
  end

  private

  attr_accessor :secret_number
end

game = GuessingGame.new(400, 1000)
game.play

