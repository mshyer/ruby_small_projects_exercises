items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

#1 
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!
gather(items) do |*produce, wheat|
  puts produce.join(", ")
  puts wheat
end

#2
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do | apples, *others, wheat |
  puts apples
  puts others.join(", ")
  puts wheat
end

#3
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do | apples, *others |
  puts apples
  puts others.join(", ")
end

#4
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

gather(items) do | apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, #{wheat}"
end