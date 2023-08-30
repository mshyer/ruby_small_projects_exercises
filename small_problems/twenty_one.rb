# Twenty-one is a game similar to Blackjack implemented in Ruby.
require "pry"
CARDS = *(1..52)
CARD_NAMES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace Joker)
DECK_VALUES = {
  HEARTS: {
    suit: "Hearts", cards: [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49]
  },
  SPADES: {
    suit: "Spades", cards: [2, 6, 10, 14, 18, 22, 26, 30, 34, 38, 42, 46, 50]
  },
  CLUBS:  {
    suit: "Clubs", cards: [3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43, 47, 51]
  },
  DIAMONDS: {
    suit: "Diamonds", cards: [4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52]
  }
}

def prompt(string)
  prompt_string = "=> "
  puts "#{prompt_string} #{string}"
end

def print_hand_info(hand)
  statement = "Player hand: "
  hand.each do |card|
    statement += "#{return_card_info(card)}. "
  end
  prompt(statement)
end

def hand_info(hand)
  statement = ""
  hand.each do |card|
    statement += "#{return_card_info(card)}. "
  end
  statement
end

def print_flip_cards(hand1, hand2)
  prompt("Player Hand: #{hand_info(hand1)} Dealer hand: #{hand_info(hand2)}")
  prompt("Player hand value: #{hand_value(hand1)}" \
  " Dealer hand value: #{hand_value(hand2)}")
end

def print_dealer_hand_info(hand)
  statement = "Dealer hand: "
  statement += "#{return_card_info(hand[0])} and one hidden card"
  prompt(statement)
end

def print_hand_value(hand)
  prompt("The value of your hand is: #{hand_value(hand)}")
end

def print_welcome_message
  prompt("Welcome to Twenty-One.")
  prompt("Shuffling Cards and dealing cards")
end

def return_CARD_NAMES_index(shuffled_card)
  index = 0
  DECK_VALUES.each_value do |hash|
    if hash[:cards].include?(shuffled_card)
      index = hash[:cards].index(shuffled_card)
    end
  end
  index
end

def return_DECK_VALUES_suit(shuffled_card)
  DECK_VALUES.each_value do |hash|
    if hash[:cards].include?(shuffled_card)
      return hash[:suit]
    end
  end
end

def return_card_info(shuffled_card)
  index = return_CARD_NAMES_index(shuffled_card)
  suit = return_DECK_VALUES_suit(shuffled_card)
  card_printout = "#{CARD_NAMES[index]} of #{suit}"
  card_printout
end

def calculate_ace_value(hand_value)
  if hand_value >= 11
    1
  else
    11
  end
end

def is_ace?(card)
  return_CARD_NAMES_index(card) == 12
end

def card_value(shuffled_card)
  card_value = 0
  case return_CARD_NAMES_index(shuffled_card)
  when 0..8
    card_value = return_CARD_NAMES_index(shuffled_card) + 2
  when 9..11
    card_value = 10
  when 12
    puts "ERROR ACE"
  end
  card_value
end

def init_hands(hand1, hand2, deck)
  hand1.clear
  hand2.clear
  hand1 << deck.shift
  hand2 << deck.shift
  hand1 << deck.shift
  hand2 << deck.shift
end

def hit(hand, deck)
  hand << deck.shift
end

def hand_value(hand)
  total = 0
  aces = 0
  hand.each do |card|
    if is_ace?(card)
      aces += 1
    else
      total += card_value(card)
    end
  end
  aces.times do
    total += calculate_ace_value(total)
  end
  total
end

def shuffle_deck_with_statement(deck)
  deck.clear
  CARDS.shuffle.each do |card|
    deck << card
  end
  prompt("Deck shuffled")
end

def play_again?
  prompt("Would you like to play again? (y/n)")
  response = gets.chomp.downcase
  if response.start_with?("y")
    true
  else
    false
  end
end

def boolean_player_move(player_input)
  if player_input.downcase.start_with?("h")
    true
  else
    false
  end
end

def compare_hands(hand1, hand2)
  if hand_value(hand1) > hand_value(hand2)
    1
  elsif hand_value(hand1) == hand_value(hand2)
    2
  else
    3
  end
end

def dealer_turn(dealer_hand, deck)
  dealer_hand << deck.shift until hand_value(dealer_hand) >= 17
end

def bust?(hand)
  hand_value(hand) > 21
end

## INIT CODE
player_hand = []
dealer_hand = []
game_deck = []
player_score = 0
dealer_score = 0
prompt("Welcome to Twenty-one!")

# MAIN GAME LOOP
loop do
  puts "\e[H\e[2J"
  print_welcome_message
  shuffle_deck_with_statement(game_deck)
  init_hands(player_hand, dealer_hand, game_deck)
  print_hand_info(player_hand)
  print_dealer_hand_info(dealer_hand)

  loop do
    prompt("Hit or stay? (H/S)")
    choice_response = gets.chomp
    if boolean_player_move(choice_response)
      hit(player_hand, game_deck)
      print_hand_value(player_hand)
      print_hand_info(player_hand)
      if bust?(player_hand)
        prompt("Bust!")
        dealer_score += 1
        break
      end
    else
      dealer_turn(dealer_hand, game_deck)
      break
    end
  end
  if bust?(dealer_hand)
    prompt("Dealer Bust!")
    player_score += 1
  end
  if !bust?(player_hand) && !bust?(dealer_hand)
    if compare_hands(player_hand, dealer_hand) == 1
      player_score += 1
      print_flip_cards(player_hand, dealer_hand)
      prompt("You won the round!")
    elsif compare_hands(player_hand, dealer_hand) == 3
      dealer_score += 1
      print_flip_cards(player_hand, dealer_hand)
      prompt("The dealer won the round!")
    else
      print_flip_cards(player_hand, dealer_hand)
      prompt("It's a wash!")
    end
  end
  prompt("The score is Player: #{player_score}, Dealer: #{dealer_score}.")
  break unless play_again?
end

# puts shuffled_deck.count
# first_hand(player_hand, shuffled_deck)
# print_hand_info(player_hand)
# print_hand_value(player_hand)
# prompt("Hitting")
# hit(player_hand, shuffled_deck)
# print_hand_info(player_hand)
# print_hand_value(player_hand)

# first_hand(computer_hand, shuffled_deck)
# computer_hand.each do |card|
#   puts return_card_info(card)
# end
# puts hand_value(computer_hand)

# puts shuffled_deck.count

# TEST CASES
# puts return_card_info(42)
# puts return_card_info(2)
# puts return_card_info(6)
# puts return_card_info(12)
# puts return_card_info(51)

# puts card_value(42)
# puts card_value(5)
# puts card_value(31)
# puts card_value(34)
# puts card_value(22)
# puts card_value(15)
# puts card_value(49)
# puts card_value(50)
