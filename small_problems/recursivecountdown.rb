##Writes a method that counts down to zero using recursion.

def recursive(x)
  puts(x)
  if x > 0
    x -= 1
    recursive(x)
  end
end

recursive(10)