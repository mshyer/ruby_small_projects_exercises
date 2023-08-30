def triangle(a1, a2, a3)
  arr = [a1, a2, a3].sort
  if arr[0] == 0 || arr.sum != 180
    :invalid
  elsif arr[2] == 90
    :right
  elsif arr[2] > 90
    :obtuse
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid