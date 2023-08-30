#coding own times method
def n_times(n, &proc)
  i = 0
  loop do
    #We need to call the block with i. Proc object retains the binding for var i even on line 12
    proc.call(i)
    i += 1
    break if i == n
  end
  n
end

n_times(3) do |x|
  puts x
end

#From the course materials:
# method implementation
def times(number)
  counter = 0
  while counter < number
    yield(counter)
    counter += 1
  end
  
  number
end

  # counter = 0
  # while counter < number do
  #   yield(counter)
  #   counter += 1
  # end

  # number                      # return the original method argument to match behavior of `Integer#times`
# end

# method invocation
times(5) do |num|
  puts num
end

# Output:
# 0
# 1
# 2
# 3
# 4
# => 5