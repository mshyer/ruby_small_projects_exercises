=begin
Nouns: card, player, dealer, participant, deck, game, total
Verbs: deal, hit, stay, busts

Participant
    -Hit
    -stay
    -busted?
    -total
  Dealer < Participant
    -AI_hit_or_stay
  Player < Participant
Deck
  -deal
Card
Game
=end

module TerminalControl
  def pause_clear(n = 1)
    sleep n
    system 'clear'
  end
end

module HandActions
  include TerminalControl

  def hit(person)
    person.cards << deck.cards.shift
  end

  def deal
    puts "dealing cards"
    hit(player)
    hit(dealer)
    hit(player)
    hit(dealer)
    pause_clear
  end

  # def stay
  # end

  def busted?(player)
    player.sum_of_cards > 21
  end

  # def total
  #   #Need to know about cards
  # end
end

class Participant
  attr_accessor :name, :cards, :score

  include HandActions

  def initialize
    @cards = []
    @name = "Participant"
    @score = 0
  end

  def card_values_array
    cards.map(&:value)
  end

  def sum_of_cards
    values = card_values_array
    if values.sum > 21
      values.map do |value|
        value == 11 ? 1 : value
      end.sum
    else
      values.sum
    end
  end

  def hand_string
    cards.map(&:to_s).join(": ")
  end

  def to_s
    name
  end
end

class Player < Participant
  include HandActions

  def initialize
    super
    set_name
  end

  def set_name
    temp_name = ''
    puts "Please enter your name"
    loop do
      temp_name = gets.chomp
      break unless temp_name == ''
      puts "please enter a valid name"
    end
    self.name = temp_name
  end
end

class Dealer < Participant
  def initialize
    super
    @name = "Dealer"
  end

  def hand_string
    s = nil
    s = "s" if cards.length > 2
    "#{cards[0]} and #{cards.length - 1} card#{s} face down"
  end

  def revealed_hand_string
    cards.join(", ")
  end
end

class Deck
  include TerminalControl
  attr_accessor :cards

  def initialize
    # need to keep track of cards
    # array, hash?
    @cards = []
    init_cards
  end

  def init_cards
    52.times { cards << Card.new }
  end

  def shuffle
    system 'clear'
    puts "Shuffling cards"
    cards.shuffle!
    sleep 1
  end

  def to_s
    cards.each { |card| puts card }
  end
end

class Card
  attr_reader :value, :name, :suit

  CARD_KEYS = [
    [2, "Two"], [3, "Three"], [4, "Four"],
    [5, "Five"], [6, "Six"], [7, "Seven"],
    [8, "Eight"], [9, "Nine"], [10, "Ten"],
    [10, "Jack"], [10, "Queen"], [10, "King"],
    [11, "Ace"]
  ]
  SUITS = ["Hearts", "Diamonds", "Clubs", "Spades"]
  @@card_number = 0
  @@suit_number = 0

  def initialize
    # What are the states of a card?
    @value = CARD_KEYS[@@card_number][0]
    @name = CARD_KEYS[@@card_number][1]
    @suit = SUITS[@@suit_number]
    @hidden = false
    Card.increment_card_number
  end

  def self.reset
    @@card_number = 0
    @@suit_number = 0
  end

  def self.increment_card_number
    if @@card_number == 12
      @@card_number = 0
      @@suit_number += 1
    else
      @@card_number += 1
    end
  end

  def to_s
    "#{name} of #{suit}"
  end
end

class Game
  include HandActions
  attr_accessor :deck
  attr_reader :player, :dealer

  def initialize
    @deck = Deck.new
    @dealer = Dealer.new()
    @player = Player.new()
  end

  def play
    loop do
      deck.shuffle
      deal
      show_initial_cards
      main_gameplay
      break unless play_again?
      reset
    end
    puts "Goodbye!"
  end

  def reset
    Card.reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def play_again?
    answer = ''
    loop do
      puts "Play again? Y/N"
      answer = gets.chomp.chr.downcase
      break if ["y", "n"].include?(answer)
      puts "Please enter Y/N"
    end
    answer == 'y'
  end

  def main_gameplay
    take_turns
    return if busted?(dealer) || busted?(player)
    flip_cards
    show_result
  end

  def show_result
    result = player.sum_of_cards <=> dealer.sum_of_cards
    case result
    when -1
      dealer_win
    when 0
      tie
    when 1
      player_win
    end
  end

  def player_win
    player.score += 1
    puts "#{player.name} won the round!"
  end

  def tie
    puts "It was a tie!"
  end

  def dealer_win
    dealer.score += 1
    puts "#{dealer.name} won the round!"
  end

  def flip_cards
    pause_clear
    puts "Time to flip cards! What've we got?"
    puts "#{player.name}'s hand: [#{player.hand_string}" \
    " (Value: #{player.sum_of_cards})]"
    puts "#{dealer.name}'s hand: [#{dealer.revealed_hand_string}" \
    " (Value: #{dealer.sum_of_cards})]"
  end

  def take_turns
    player_turn
    if busted?(player)
      dealer.score += 1
      return print_busted_message(player, dealer)
    end
    dealer_turn
    if busted?(dealer)
      player.score += 1
      print_busted_message(dealer, player)
    end
  end

  def print_busted_message(buster, winner)
    puts "#{buster} busted! #{winner} won the round."
  end

  def player_turn
    loop do
      break unless hit?
      hit(player)
      puts "You drew a #{player.cards[-1]}"
      if busted?(player)
        return
      end
      puts "Current Hand: #{player.hand_string}"
    end
    puts "You chose stay"
  end

  def dealer_turn
    pause_clear
    puts "Dealer Turn..."
    loop do
      if dealer.sum_of_cards >= 17
        puts "Dealer chose to Stay"
        break
      else
        hit(dealer)
        puts "Dealer hit. Current hand value: #{dealer.sum_of_cards}"
        puts "Dealer score: #{dealer.sum_of_cards}"
        sleep 1
      end
      if busted?(dealer)
        return
      end
    end
  end

  def hit?
    puts "Current hand value: #{player.sum_of_cards}"
    puts "Hit or Stay? [1] hit [2] stay"
    answer = 0
    loop do
      answer = gets.chomp.to_i
      break if [1, 2].include?(answer)
      puts "Please enter 1 or 2"
    end
    answer == 1
  end

  # def main_info
  # end

  def show_initial_cards
    system 'clear'
    display_score
    puts "#{player.name}'s hand: [#{player.hand_string}]"
    puts "#{dealer.name}'s hand: [#{dealer.hand_string}]"
  end

  def display_score
    puts "Current score: #{player}: #{player.score}, #{dealer}: #{dealer.score}"
  end
end

Game.new.play
