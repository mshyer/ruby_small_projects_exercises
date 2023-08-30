class Shelter
  @@owners = []
  @@pets = []

  def self.pets
    @@pets
  end

  def self.owners
    @@owners
  end

  def adopt(owner, pet)
    owner.pets << pet
    @@pets.delete_at(@@pets.index(pet))
  end

  def print_adoptions()
    @@owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.pets.each do |pet|
        puts "a #{pet.type} named #{pet.name}"
      end
    end
  end
end

class Owner 
  attr_accessor :pets, :name
  def initialize(name, pets = [])
    @name = name
    @pets = pets
    Shelter.owners << self
  end

  def number_of_pets
    self.pets.length
  end
end

class Pet 
  attr_accessor :type, :name
  def initialize(type, name)
    @type = type
    @name = name
    Shelter.pets << self
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
booger        = Pet.new('sardine', 'Booger')
wizard_dog      = Pet.new('dog', 'Wizard')
#snoop      = Pet.new('dogg', 'Snoop the D.O.G.G.')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "the Shelter has #{Shelter.pets.length} unadopted pets."