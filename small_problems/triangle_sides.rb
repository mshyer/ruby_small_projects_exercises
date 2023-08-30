TRIANGLES = { invalid: 1, equilateral: 2, scalene: 3, isosceles: 4 }
def triangle(n1, n2, n3)
  sides = [n1, n2, n3].sort
  type = 0
  if ((sides[0] + sides[1]) <= sides[2]) || sides[0] <= 0
    :invalid
  elsif sides[0] == sides[1] && sides[0] == sides[2]
    :equilateral
  elsif sides.uniq == sides
    :scalene
  else 
    :isosceles
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid