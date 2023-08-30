class Person
  def age
    double(@age)
  end

  def age=(input)
    @age = double(input)
  end

  private
   
  def double(data)
    data * 2
  end
  
end

person1 = Person.new
person1.age = 20
puts person1.age