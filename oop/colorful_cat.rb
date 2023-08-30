class Cat
  COLOR = "Hypo-allergenic Siamese"
  attr_reader :name
  def initialize(n)
    @name = n
  end

  def greet
    puts "#{self.name}, the #{COLOR} cat, says hello."
  end

  def to_s
    "Hi! I'm #{self.name}"
  end

end


kitty = Cat.new('Sophie')
kitty.greet
puts kitty