#Write the methods name and activity so that they each take the appropriate array and 
#return a random value from it. Then write the method sentence that combines 
#both values into a sentence and returns it from the method.


names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name (array)
  array.sample
end

def activity(array)
  array.sample
end


def sentence(word1, word2)
  "#{word1} enjoys #{word2} more than a piece of chocolate cake with extra frosting"
end

puts sentence(name(names), activity(activities))