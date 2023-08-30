class Cat
  @@cats = 0
  def self.total
    puts @@cats
  end
  def initialize()
    @@cats += 1
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total
