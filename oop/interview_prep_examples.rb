=begin
In this code I will be preparing code examples for the RB129 interview.
=end

# 1. Inheritance
# Inheritance is a form of polymorphism, where a class inherits the behaviors of another class. 
# The class that inherits behaviors is called a SUBclass. The class that it inherits from is called the SUPERclass.
# Inheritance is useful for mapping out hierarchical relationships in code.

# Code Example: Taxonomy

class Animal
  def info
    "A #{self.class}"
  end
end

class Bird < Animal
  def fly
    puts "Bird is flying!"
  end
end

class Fish < Animal
  def swim
    puts "Fish is swimming!"
  end

end

class Mammal < Animal
end

class Human < Mammal
  def think
    puts "The human is thinking!"
  end
end

# bob = Human.new
# bob.think
# p bob.info

# nemo = Fish.new
# nemo.swim
# p nemo.info

# mystery = Animal.new
# p mystery.info
#_______________________________________________________________
#2. Modules
# A  module is a container for some code that shares common features, (ie classes or behaviors) that can be mixed in where appropriate
# to the code base. This is called"Mixin modules" and sometimes "interface inheritance". 
# Modules can include related classes as a form of namespacing.
# Modules of methods can be mixed into whatever class needs to share in those behaviors.
# For this reason, mixins are useful when dealing with non-hierarchical relationships.

# Code example: Readable. Many otherwise unrelated objects can be read.

module Readable
  attr_reader :text
  def read
    puts "Reading a #{self.class}"
    puts text
  end

  def initialize(text = "")
    @text = text
  end
end

class Billboard
  include Readable
end

class Screen
  include Readable
end

class Book
  include Readable
end

class Tome < Book
end

# billy = Billboard.new("Vote BEBOP BLOOP for Galactic Representative")
# billy.read
# screeny = Screen.new("FILES, DESKTOP, HOME SCREEN")
# screeny.read
# booky = Book.new("A Tale of Two Cities")
# booky.read
# tomey = Tome.new("A Very Very Long Tale of Two Cities")
# tomey.read

#3 Super
# The super keyword in Ruby is used to look up methods higher up in the method lookup path.
# When Ruby finds a method with the same name as the calling method, it invokes it with whatever number of arguments specified.
# This is often used in inheritance relationships, where a subclass overrides the method of a superclass, and adds additional
# class-specific behavior to its own implementation.

# Code example: to_s

class Building
  attr_reader :area

  def initialize
    @area = 100
  end

  def to_s
    "A #{self.class}"
  end

end

class DartTower < Building
  attr_reader :darts, :health, :fire_rate

  def initialize(health = 100, fire_rate = 10, darts = 50)
    super()
    @health = health
    @fire_rate = fire_rate
    @darts = darts
  end
end

class StealthDartTower < DartTower
  attr_reader :stealth

  def initialize(health = 100, fire_rate = 10, darts = 50)
    super
    @stealth = true
  end

  def to_s
    super + (stealth ? " (hidden)" : " (revealed)")
  end
end

# a = Building.new
# p a.to_s

# b = DartTower.new
# p b.to_s

# c = StealthDartTower.new
# p c.to_s

#4 Calling Methods with Self // Class vs instance methods
# In ruby, "self" refers to the calling object. Inside of an instance method, self refers to the instance (object) that called the method. 
# Outside of an instance method, but within the class body, self refers to the class itself.


# code example: 

class Franchise
  attr_reader :name, :inventory

  @@count = 0

  def self.count
    puts "There are currently #{@@count} franchise stores"
  end

  def self.info
    puts "The Franchise brand of stores is a nationwide super brand!"
  end

  def initialize(name = store, inventory = "Apples, Peaches, Pears, Plums")
    @@count += 1
    @name = name
    @inventory = inventory
  end

  def print_inventory
    puts "#{self} store inventory: #{self.inventory}"
  end

  def to_s
    "#{name}"
  end
end

class Thing
  attr_reader :data
  def initialize(data)
    @data = data
  end
end


store1 = Franchise.new("Reginald Square", "Chairs, Tables and Garden Items")
store2 = Franchise.new("Cherry St", "Plums, Stuffed Animals and Gummy Bears")
Franchise.info
Franchise.count

store2.print_inventory

# 5 Encapsulation: Encapsulation is...

class Book
  attr_reader :text, :author
  attr_writer :owner

  def initialize(text, author, owner = nil)
    @text = text
    @author = author
    @owner = owner
  end

  def read_text
    puts "Text: #{text}"
  end
end

gatsby = Book.new("text", "Fitzgerald", "Library")
p gatsby.author

#6 collaborator objects... collaborator objects are objects that make
# up the state of instances of classes. For example, a book might have
# multiple paragraphs (p1, p2, p3, etc), where each paragraph is a String.
# In this case, the String object woule be a collaborator. In a bookshelf,
# an array of book objects might store each

class Book
  def initialize(p1, p2, p3)
    @p1 = p1
    @p2 = p2
    @p3 = p3
  end
end

class Shelf
  def initialize(books = [])
    @books = books
  end
end

book1 = Book.new("Text.", "More text.", "Even more text.")
book2 = Book.new("Text.", "More text.", "Even more text.")

shelf = Shelf.new([book1, book2])

p shelf

#7 access modifiers
module MoneyTime
  class Wallet
    def initialize(public_id, password, value)
      @public_id = public_id
      @password = password
      @value = value
    end

    #public interface
    def public_id
      @public_id
    end

    def sum(other_wallet)
      value + other_wallet.value
    end

    private

    def password
      @password
    end

    protected

    def value
      @value
    end
  end
end

wallet1 = MoneyTime::Wallet.new(0, 123, 5)
wallet2 = MoneyTime::Wallet.new(1, 456, 10)

# puts wallet1.sum(wallet2)
# puts wallet1.public_id
# puts wallet2.public_id

#7 fake operators << <=>
class Wallet2
  EURO_TO_DOLLAR = 2
  attr_reader :type, :value
  include Comparable

  def initialize(type, value)
    @type = type
    @value = value 
  end

  def <=>(other)
    self.value_in_dollars <=> other.value_in_dollars
  end

  protected

  def value_in_dollars
    if type == "dollar"
      value
    else
      value * EURO_TO_DOLLAR
    end
  end

end

q1 = Wallet2.new("dollar", 50)
q2 = Wallet2.new("euro", 20)
p q1 <=> q2
p q2 <=> q1
p q1 > q2