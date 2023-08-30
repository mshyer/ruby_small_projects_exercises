=begin
Pedac:
problem: Program with class Scrabble with
        instance method score && class method score
        -Scrabble is initialized with a word
        -Method score assigns each character in word
        a score and adds all of the scores together
Examples: non-character, empty strings and nil are value 0
Data structure:
String and a constant hash of letters and their score value

Constant:
Letter	Value
A, E, I, O, U, L, N, R, S, T	1
D, G                        	2
B, C, M, P	                  3
F, H, V, W, Y	                4
K	                            5
J, X	                        8
Q, Z	                        10

=end

TILES = {
  %w(A E I O U L N R S T) => 1,
  %w(D G) => 2,
  %w(B C M P) => 3,
  %w(F H V W Y) => 4,
  %w(K) => 5,
  %w(J X) => 8,
  %w(Q Z) => 10
}

class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def score
    Scrabble.score(word)
  end

  def self.score(word)
    return 0 unless word
    word = process_word(word)
    chars = word.chars
    chars.map do |char|
      TILES.select do |key, _|
        key.include?(char.upcase)
      end.values[0]
    end.sum
  end

  def self.process_word(word)
    word&.delete('^a-zA-Z')
  end
end

game = Scrabble.new("hhah  /n\n")
puts game.score
