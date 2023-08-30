class Transform
  def self.lowercase(str)
    str.downcase
  end

  def initialize(str)
    @str = str
  end

  def uppercase
    @str.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')