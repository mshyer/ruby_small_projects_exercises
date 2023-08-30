module AnimalActions
  def DoggBark
    puts "woof woof"
  end

  def get_name
    @name
  end 

  def set_name=(name)
    @name = name
  end

end

class DoggyDoggs
  include AnimalActions
  @@number_of_doggs = 0
  DOGG_YEARS = 8
  def self.total_number_of_doggs #Class method
    @@number_of_doggs
  end

  def initialize(name, study = "Rap Artist", age = 24)
    @name = name
    @study = study
    @age = age
    @@number_of_doggs += 1
  end

  def self.what_is_it #Class method
    "This is a Doggy Dogg Class for the realest Gs in the Dogg Pound Crew"
  end

  attr_accessor :personality, :name, :taco_bell, :age  #Shortcut syntax for "You can now both getter and setter!"
  attr_reader :study          #Shortcut syntax for "You can't setter but you can still getter!" 

  def WhatsMyName  #Instance method
    puts "#{name} Doggy Dogg" ## WHY does this work? It works because attr_accessor creates an
                            # instance method "name" (a getter method) that can then be called. 
  end

  def DoggAge
    self.age * DOGG_YEARS
  end

  def change_info(n, p, taco_b)
    self.name = n
    self.personality = p
    self.taco_bell = taco_b
  end

  def to_s
    puts "This dogg's name is #{name} and it's #{self.DoggAge} years old"
  end

end
p DoggyDoggs.total_number_of_doggs
snoop_the_dogg = DoggyDoggs.new("Snoop")
p DoggyDoggs.total_number_of_doggs
sparky_the_dogg = DoggyDoggs.new("Sparky")
p DoggyDoggs.total_number_of_doggs
snoop_the_dogg.DoggBark
snoop_the_dogg.WhatsMyName
sparky_the_dogg.WhatsMyName
puts sparky_the_dogg.get_name
sparky_the_dogg.set_name = "Sparky the dogg"
puts sparky_the_dogg.get_name
snoop_the_dogg.personality = "swag fly cool"
puts snoop_the_dogg.personality
puts snoop_the_dogg.study
puts "Snoop likes to eat #{snoop_the_dogg.taco_bell}" 
            #The @taco_bell instance variable is defined in the attr_accessor method in class DoggyDoggs
            #But it is never set to a specific value so its value defaults to nil (see below)
puts snoop_the_dogg.taco_bell.class

snoop_the_dogg.change_info("Michelle Du Montifleur", "Raconteur", "La Belle Du Taco")

puts snoop_the_dogg.name
puts snoop_the_dogg.personality
puts snoop_the_dogg.taco_bell
puts DoggyDoggs.what_is_it

puts snoop_the_dogg.DoggAge

puts snoop_the_dogg.to_s
p snoop_the_dogg
puts snoop_the_dogg.inspect
