#Write a method that accepts one argument, but doesn't require it. 
#The parameter should default to the string "Bob" if no argument is given. 
#The method's return value should be the value of the argument.

def name(name = "bob")
  name
end

puts name('Kevin') == 'Kevin'
puts name == 'bob'