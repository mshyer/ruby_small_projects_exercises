def multiply(n1, n2)
  n1 * n2
end

def power_it(number, power)
  powered = number
  (power - 1).times do
    powered = multiply(number, powered) 
  end
  powered
end

p power_it(3,3)


# def square(something)
#   multiply(something, something)
# end