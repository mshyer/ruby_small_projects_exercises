class Person
  def name=(input)
    @name = input.split()
  end

  def name
    @name.join(" ")
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name