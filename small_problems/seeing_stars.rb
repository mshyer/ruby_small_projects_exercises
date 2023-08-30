#Write a method that displays an 8-pointed star in an nxn grid, 
#where n is an odd integer that is supplied as an argument to the method.
# The smallest such star you need to handle is a 7x7 grid.

#Parameter N: odd integer, at least 7
#Output: Method prints text to the console
# Grid size is equal to N
# The middle line is all stars
# All other lines have three stars separated by spaces.
# Number of blank spaces on each line is N - 3
# Half = n/2 + 1
# counter = 1
# center star = Half
# Left Star = Half - counter
# Right Star = Half + counter
# Counter += 1

def star(n)
  half = (n / 2) 
  counter = half
  half.times do |i|
    puts "#{" " * (half - counter)}*#{" " * (half-(half - counter + 1))}*#{" " * (half-(half - counter) -1)}*"
    counter -= 1
  end
  counter = 1
  puts ("*") * n
  half.times do |i|
    puts "#{" " * (half - counter)}*#{" " * (half-(half - counter + 1))}*#{" " * (half-(half - counter) -1)}*"
    counter += 1
  end
end

star(13)