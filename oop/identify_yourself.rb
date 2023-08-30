class Cat
  attr_accessor :name

  def self.generic_greeting
    puts "boring generic quotidien greeting"
  end

  def personal_greeting
    puts "Hi there I am a Cat and my name is #{name}"
  end

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
puts kitty.identify
puts kitty.inspect

Cat.generic_greeting
kitty.personal_greeting
