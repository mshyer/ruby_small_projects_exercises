FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
SUITS = ["Diamonds", "Hearts", "Clubs", "Spades"]
CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]

module ConsoleControls
  def clear
    system 'clear'
  end

  def pause(n = 1)
    sleep(n)
  end

  def exit_sequence
    puts "Thanks for playing Twenty One!"
    exit
  end

  # def prompt(input)
  #   puts "  #{input}"
  # end
end

module PrintToConsole
  def print_deal_sequence
    clear
    puts "Dealing Cards"
    pause
    puts "Dealer gives #{human} a card."
    pause
    puts "Dealer gives herself a card."
    pause
    puts "Dealer gives #{human} a card."
    pause
    puts "Dealer gives herself a card."
    pause
  end

  def greet_player
    clear
    puts "Welcome to Twenty One. First player to 3 wins!"
    human.set_name
    puts "Good luck, #{human.name}"
    pause(2)
  end

  def print_current_score
    puts "The current score is #{human.name}: #{human.score} " \
    "Dealer: #{dealer.score}"
    puts ''
  end

  def print_final_score
    puts "The final score is #{human.name}: #{human.score} " \
    "Dealer: #{dealer.score}"
    winner = dealer.score > human.score ? dealer : human
    puts "#{winner} won the game!!"
  end

  def print_hand_info
    clear
    print_current_score
    puts "Dealer hand:"
    puts "  #{dealer.hand[0]} and #{dealer.hand.count - 1} cards face down"
    puts "Your Hand:"
    human.hand.each{|card| puts("  #{card}")}
    puts ''
    puts "Hand value: #{human.hand_value}"
  end

  def flip_cards
    clear
    puts "Flip those cards!"
    puts "Dealer hand:"
    dealer.hand.each{|card| puts("  #{card}")}
    puts "Dealer hand value: #{dealer.hand_value}"
    puts "Your Hand:"
    human.hand.each{|card| puts("  #{card}")}
    puts "Hand value: #{human.hand_value}"
  end
end

module CardActions
  def deal_cards
    deck.cards.shuffle!
    print_deal_sequence
    human.hand << deck.cards.shift
    human.hand << deck.cards.shift
    dealer.hand << deck.cards.shift
    dealer.hand << deck.cards.shift
  end

  def hit(player)
    puts "#{player} chose to hit"
    pause
    player.hand << deck.cards.shift
  end

  def stay(player)
    puts "#{player} chose to stay"
  end

  def busted?(player)
    player.hand_value > 21
  end

end

class Player
  attr_accessor :score, :hand, :name
  def initialize
    @hand = []
    @score = 0
    @name = "Dealer"
  end

  def to_s
    name
  end

  def hand_value
    gross = hand.map(&:value).inject(:+)
    return gross if gross <= 21
    aces_low_hand_values = hand.map do |card|
      if card.face == "Ace"
        1
      else
        card.value
      end
    end
    aces_low_hand_values.inject(:+)
  end
end

class Human < Player
  def set_name
    name = ''
    loop do
      puts "Please enter your name"
      name = gets.chomp
      break unless name.empty?
      "Name cannot be empty"
    end
    @name = name
  end
end

class Dealer < Player
  def to_s
    "The #{name}"
  end
end

class Deck
  attr_reader :cards
  def initialize
    @cards = []
    init_deck_cards
  end

  def init_deck_cards
    SUITS.each do |suit|
      13.times do |i|
        cards << Card.new(FACES[i], suit, CARD_VALUES[i])
      end
    end
    cards.shuffle!
  end
end

class Card
  attr_reader :face, :suit, :value

  def initialize(face, suit, value)
    @face = face
    @suit = suit
    @value = value
  end

  def to_s
    "#{face} of #{suit}"
  end
  
end

class Game
  include CardActions
  include ConsoleControls
  include PrintToConsole

  attr_reader :human, :dealer
  attr_accessor :deck

  def initialize
    @dealer = Dealer.new()
    @human = Human.new()
    @deck = Deck.new()
  end

  def play
    greet_player
    loop do 
      loop do
        main_game_loop
        break if someone_won?
        reset_deck
      end
      print_final_score
      break unless play_again?
      reset_deck
      reset_score
    end
    exit_sequence
  end

  def main_game_loop
    deal_cards
    loop do
      print_hand_info
      human_turn
      if busted?(human)
        bust(human)
        break
      end
      dealer_turn
      if busted?(dealer)
        bust(dealer)
        break
      end
      flip_cards
      increment_score
      break
    end
  end

  def human_turn
    loop do 
      answer = ''
      loop do
        puts "[1]Hit or [2]Stay?  --([Q] to exit program)"
        answer = gets.chomp
        break if ([1, 2].include?(answer.to_i) ||
                ['h', 's', 'q'].include?(answer.chr.downcase))
        puts "please enter a valid response"
      end
      if answer.to_i == 1 || answer.chr.downcase == "h"
        hit(human)
        print_hand_info
        break if busted?(human)
      elsif answer.chr.downcase == 'q'
        exit_sequence
      else
        stay(human)
        break
      end
    end
  end

  def dealer_turn
    hit(dealer) until dealer.hand_value >= 17
    stay(dealer) unless dealer.hand_value > 21
    pause(2)
  end

  def bust(player)
    other = (player == human ? dealer : human)
    puts "#{player} busted! #{other} won the round!!"
    pause(3)
    other.score += 1
  end

  def increment_score
    if human.hand_value == dealer.hand_value
      puts "it's a tie"
      pause(3)
      return
    end
    winner = human.hand_value > dealer.hand_value

    if winner
      puts "#{human.name} won the round!"
      human.score += 1
    else
      puts "The dealer won the round!"
      dealer.score += 1
    end
    pause(3)
  end

  def someone_won?
    human.score == 3 || dealer.score == 3
  end

  def play_again?
    answer = ''
    loop do
      puts "Play again? Y/N"
      answer = gets.chomp
      break if ["y", "n"].include?(answer.chr.downcase)
      puts "Please enter Y or N"
    end
    answer.chr.downcase == "y"
  end

  def reset_deck
    self.deck = Deck.new()
    self.human.hand = []
    self.dealer.hand = []
  end

  def reset_score
    human.score = 0
    dealer.score = 0
  end

end


game = Game.new()
game.play
