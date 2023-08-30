# Include Card and Deck classes from the last two exercises.

class PokerHand
  CARD_FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
  attr_reader :hand

  def initialize(deck)
    @deck = deck
    @hand = []
    5.times{@hand << deck.draw}
    #@hand = [Card.new("Ace", "Hearts"), Card.new("King", "Hearts"), Card.new("Queen", "Hearts"), Card.new("Jack", "Hearts"), Card.new(10, "Hearts")]
    #@hand = [Card.new("Queen", "Hearts"), Card.new("Jack", "Hearts"), Card.new(10, "Hearts"), Card.new(9, "Hearts"), Card.new(9, "Hearts")]
    #@hand = [Card.new("Queen", "Hearts"), Card.new("Queen", "Hearts"), Card.new("Queen", "Hearts"), Card.new("Queen", "Hearts"), Card.new(9, "Hearts")]
    #@hand = [Card.new("Queen", "Hearts"), Card.new(9, "Hearts"), Card.new(8, "Hearts"), Card.new(9, "Hearts"), Card.new(9, "Hearts")]
    # @hand = [Card.new("Queen", "Hearts"), Card.new("Queen", "Hearts"), Card.new(9, "Hearts"), Card.new(8, "Hearts"), Card.new(9, "Hearts")]
    # @hand = [Card.new("Queen", "Hearts"), Card.new("Queen", "Hearts"), Card.new(7, "Hearts"), Card.new(8, "Hearts"), Card.new(9, "Hearts")]
    # @hand = [Card.new("Queen", "Hearts"), Card.new("Queen", "Hearts"), Card.new(9, "Hearts"), Card.new(9, "Hearts"), Card.new(9, "Hearts")]
  end

  def print
    hand.each{|card| puts card}
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    # ahand = [Card.new("Ace", "Hearts"), Card.new("King", "Hearts"), Card.new("Queen", "Hearts"), Card.new("Jack", "Hearts"), Card.new("10", "Hearts")]
    suits = hand.map(&:suit)
    ranks = hand.map(&:rank).map(&:to_s)
    return false unless suits.uniq.length == 1 && ranks.sort == ["10", "Ace", "Jack", "King", "Queen"]
    true
  end

  def straight_flush?
    suits = hand.map(&:suit)
    return false unless suits.uniq.length == 1 && straight?
    true
  end

  def four_of_a_kind?
    faces = hand.map(&:rank)
    CARD_FACES.each do |face|
      return true if faces.count(face) == 4
    end
    return false
  end

  def full_house?
    faces = hand.map(&:rank)
    two_count = 0
    three_count = 0
    CARD_FACES.each do |face|
      two_count += 1  if faces.count(face) == 2
      three_count += 1 if faces.count(face) == 3
    end
    two_count == 1 && three_count == 1
  end

  def flush?
    suits = hand.map {|card| card.suit}
    return false unless suits.uniq.length == 1
    true
  end

  def straight?
    indexes = hand.map(&:rank).map{|face| CARD_FACES.index(face)}
    p indexes
    1.upto(4) do |idx|
      return false unless indexes.include?(indexes.min + idx)
    end
    true
  end

  def three_of_a_kind?
    faces = hand.map(&:rank)
    CARD_FACES.each do |face|
      return true if faces.count(face) == 3
    end
    return false
  end

  def two_pair?
    faces = hand.map(&:rank)
    count = 0
    CARD_FACES.each do |face|
      count += 1  if faces.count(face) == 2
    end
    count == 2
  end

  def pair?
    faces = hand.map(&:rank)
    count = 0
    CARD_FACES.each do |face|
      count += 1  if faces.count(face) == 2
    end
    count == 1
  end
end

class Deck
  attr_accessor :cards

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  def initialize
    @cards = []
    init_cards
  end

  def draw
    a = cards.pop
    init_cards if cards.empty?
    a
  end

  def init_cards
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
    shuffle_cards
  end

  def shuffle_cards
    cards.shuffle!
  end
end



class Card
  include Comparable
  attr_reader :rank, :suit

  CARD_FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
  CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

  SUITS = ["Diamonds", "Clubs", "Hearts", "Spades"]

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    CARD_VALUES[CARD_FACES.index(rank)] <=>
      CARD_VALUES[CARD_FACES.index(other.rank)]
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

# hand = PokerHand.new(Deck.new)

# #p hand.royal_flush?
# hand.print
# #p hand.straight_flush?
# #p hand.three_of_a_kind?
# #p hand.four_of_a_kind?

# p hand.evaluate

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

puts hand.class::CARD_FACES