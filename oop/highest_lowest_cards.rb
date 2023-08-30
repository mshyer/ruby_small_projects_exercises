

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
end

def shuffle_cards
  cards.shuffle!
end

class Card
  include Comparable
  attr_reader :rank, :suit
  CARD_FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
  CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    # [2, 2], [3, 3], [4, 4], [5, 5]
    # [6, 6], [7, 7], [8, 8], [9, 9]
    # [10, 10], ["Jack", 11], ["Queen", 12]
    # ["King", 13], ["Ace", 14]
  SUITS = ["Diamonds", "Clubs", "Hearts", "Spades"]

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    # Further exploration code in comments below.
    # if CARD_VALUES[CARD_FACES.index(rank)] == CARD_VALUES[CARD_FACES.index(other.rank)]
    #   return SUITS.index(suit) <=> SUITS.index(other.suit)
    # end
    CARD_VALUES[CARD_FACES.index(rank)] <=> CARD_VALUES[CARD_FACES.index(other.rank)]
  end

  # def ==(other)
  #   CARD_VALUES[CARD_FACES.index(rank)] == CARD_VALUES[CARD_FACES.index(other.rank)]
  # end

  def to_s
    "#{rank} of #{suit}"
  end

end

deck = Deck.new()

#examples
# cards = [Card.new(2, 'Hearts'),
#          Card.new(2, 'Spades'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards.min.to_s
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.