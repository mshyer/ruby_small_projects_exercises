def step(n1, n2, step)
  i = n1
  loop do
    yield(i)
    i += step
    break if i > n2
  end
  nil
end

step(1, 10, 3) { |value| puts "value = #{value}" }