class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
end

class Team
  attr_accessor :name, :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    temp_team = Team.new("Combined team: #{@name} + #{other_team.name}")
    temp_team.members = members + other_team.members
    temp_team
  end

  def [](idx)
    members[idx]
  end

  def []=(idx, obj)
    members[idx] = obj
  end

  def to_s
    members.map do |member|
      member.name
    end
  end
end

cowboys = Team.new("Dallas Cowbells")
cowboys << Person.new("Colonel Sanders", 48)
cowboys << Person.new("George HW Bush", 46)
cowboys << Person.new("Jackie Chan", 49)


niners = Team.new("San Francisco Whats the Timers")
niners << Person.new("Hannah Montana", 59)
niners << Person.new("Vegan Rice Bowl", 52)
niners << Person.new("Bernie Sanders", 47)

dream_team = cowboys + niners
#dream_team.name = "Dream Team"
puts dream_team.to_s
puts dream_team.name

dream_team[4]
dream_team[5] = Person.new("JJ", 72)

#puts dream_team.inspect