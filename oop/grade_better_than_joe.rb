=begin
Create class student with attributes name and grade. Grade should NOT be public.

Joe.grade should raise an error

create better_grade_than? method that is public

=end

class Student

  attr_writer :grade
  attr_accessor :name

  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than?(p2)
    puts grade > p2.grade ? "Good job #{name}" : "Bad job #{name}"
  end

  protected

  def grade
    @grade
  end

end

class Uninitiated
end

joe = Student.new("Joe", 86)

ben = Student.new("Ben", 83)

joe.better_grade_than?(ben)
ben.better_grade_than?(joe)

mike = Uninitiated.new
puts mike