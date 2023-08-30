module Walkable
  def walk
    puts "#{self.name} is going on a walk, as per the experiment. \nWhether it comes back is yet to be determined."
  end
end

class Cat
  attr_accessor :name
  include Walkable
  # attr_reader :name
  # attr_writer :name

  def initialize(n)
    @name = n
    puts "Cat #{@name} is ready for experimentation."
    greet
  end

  def greet
    puts "Hello! My name is #{self.name} and I am a sentient cat."
  end
end

kitty = Cat.new('Sophie')
kitty.name = "Humphrey"

p kitty.name

kitty.walk