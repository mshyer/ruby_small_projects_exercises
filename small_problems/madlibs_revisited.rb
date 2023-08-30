ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

adjective = ADJECTIVES.sample
noun = NOUNS.sample
verb = VERBS.sample
adverb = ADVERBS.sample
# a = ""
# a << File.open("madlibs.txt").gets
# p a.delete("")
# puts "#{adjective}"
a = "potatoooo"
text = File.read('madlibs.txt') 
puts text % a