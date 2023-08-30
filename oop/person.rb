
class Person
  attr_accessor :last_name, :first_name
  def initialize(f)
    parse_name(f)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(input)
    parse_name(input)
  end

  def to_s
    name
  end

  private

  def parse_name(full_name)
    data = full_name.split
    self.first_name = data[0]
    self.last_name = data[1]
  end

end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'
bob.name


bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name

puts bob

p bob.to_s