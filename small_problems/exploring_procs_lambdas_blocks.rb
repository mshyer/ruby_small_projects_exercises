# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# block_method_2('turtle') { puts "This is a #{animal}."}

=begin
#OBSERVATIONS:
GROUP 1
A new Proc object can be created with a call of proc instead of Proc.new
The proc definition includes a block variable, `thing`, however, this is an optional parameter because procs have loose arity.
THis is demonstrated when the proc is called with no argument and does not raise an error, instead passing in nil.

GROUP 2
Lambdas are a type of Proc. This is why my_lambda.class returns Proc, and why puts my_lambda returns Proc with (lambda) in parentheses.
Lambdas have stricter arity than normal Procs, meaning they check for the correct number of arguments. This is why my_lambda.call raises
An error. No argument is passed into the |thing| parameter, and it needs an argument. Finally, there is no class `Lambda`. On the last line,
my_third_lambda raises an error, because Lambda.new doesn't work. Instead, Lambdas are created using the first two syntaxes.

GROUP 3
When using keyword `yield` within a method, Ruby will raise a LocalJumpError if no block is provided to the method as an argument.
Unless used with a guard clause like `yield if block_given?`

GROUP 4
This group of examples demonstrates that 'yielding' to a block has loose arity. Therefore, when the block is defined in
block_method_2 taking optional arguments, turtle and seal. `yield`` on line 2 of the method definition only passes in one
of these 2 arguments, but this doesn't raise an error. Instead, `seal` is passed in with value nil, and therefore the output is
=> "This is a turtle and a ."
However, the last call, the block {puts "This is a #{animal}"} raises a NameError, as within the block, Ruby has to look somewhere for the
variable animal. Blocks will throw an error if a variable is referenced that doesn't exist in the block's scope.
=end