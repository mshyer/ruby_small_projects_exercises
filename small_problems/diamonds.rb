

=begin
Write a method that prints a 4 pointed diamond to the screen of size n
Input integer n
Output: Print to screen a diamond with length of n
Algorithm 
1 n times print to screen,with index
2 center a certain number of stars in n
  half is (n/2 + 1)
  line = index + 1
  stars is n - (2 * (abs(half - line))) 
puts stars centered(n)

diamond(9)

    * 1..1
   *** 2.. 3 half is 5(n/2 + 1). n - (2 * (abs(half - line))) 
  ***** 3.. 5
 *******
*********
 ******* 
  *****
   ***
    *
    
=end

def diamond(n)
  half = (n/2) + 1
  n.times do |i|
    line = i + 1
    puts ("*" * (n - (2 * ((half - line).abs)))).center(n)
  end
end



=begin
further exploration:
write a method that creates the diamond but hollow
algorithm: 
modify the math above so it puts * + math-2 spaces + *
unless the line is 1 or n, then puts * centered in n

=end

def hollow_diamond(n)
  half = (n/2) + 1
  n.times do |i|
    line = i + 1
    if line == 1 || line == n
      puts "*".center(n)
    else
      puts ("*#{(" " * (n - (2 * ((half - line).abs))-2))}*").center(n)
    end
  end
end

hollow_diamond(5)





# def diamond(number)
#   counter = 0
#   number/2.times do 
#     puts statement(counter, number)
#     counter += 1
#   end
# end

# def statement(line, number)
#   left = " " * ((number / 2) - line)
#   mid = "*" * (number - ((number / 2 - line) * 2))
#   right = " " * ((number / 2) - line)

#   a = "#{left}#{mid}#{right}"
# end

# def diamond(size)
#   lines = (1..size).to_a
#   lines.each do |line|
#     line_stars = stars(line, size)
#     p line_stars.center(size)
#   end
# end

# def stars(line, size)
#   middle_line = (size / 2) + 1
#   stars = size - (2 * ((middle_line) - line).abs)
#   "*" * stars
# end

# # def blanks(stars)
# #   blanks = (9 - stars.length) / 2
# #   " " * blanks
# # end

# diamond(9)