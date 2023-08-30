def compute(value)
  return "Does not compute." unless block_given?
  yield(value)
end

p compute(70) {|x| x + 5 + 3 } == 78
p compute("a") { |x| x + 'a' + 'b' } == 'aab'
p compute(true) { |x| puts "Hello" if x } == nil