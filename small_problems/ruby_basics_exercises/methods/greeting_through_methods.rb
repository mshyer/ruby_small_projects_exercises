#Write two methods, one that returns the string "Hello" and one that returns the string "World". 
#Then print both strings using #puts, combining them into one sentence.

def hello
  "hello"
end

def world 
  "world"
end

def greet (method1, method2)
  puts "#{method1} #{method2}"
end

greet(hello, world)
