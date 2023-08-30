
# Given an n x n nested array sort it from the outermost to innermost elements
# [1,2,3,1]
# [4,5,6,4]
# [7,8,9,7]
# [7,8,9,7]

# 11 12 13 14 24 34 44 43 42 41 31 21 22 23 33 32 

# SWITCH DIRECTION CLOCKWISE WHEN YOU HIT THE END
# n = 4
# iterator = 0
# a, b = 0, 0

def snail(arr)
  i = 0
  n = arr[0].length
  a, b = 0, 0
  output = [arr[0][0]]
# BIG LOOP
  loop do

   loop do
    break if output.length >= arr.flatten.length
     b += 1
     break if b == n - i
     output << arr[a][b]
   end
   b -= 1

   loop do
    break if output.length >= arr.flatten.length
     a += 1
     break if a == n - i
     output << arr[a][b]
   end
    a -= 1

    loop do
      break if output.length >= arr.flatten.length
      b -= 1
      output << arr[a][b]
      break if b == i 
    end
    i += 1

    loop do
      break if output.length >= arr.flatten.length
      a -= 1
      output << arr[a][b]
      break if a == i 
    end

    if output.length >= arr.flatten.length
      p output
      p a
      p b
      return output[0..(arr.length-1)]
    end

  end

end
# init output arr [0, 0]







# AT END OF BIG LOOP



# input: nested arr
# output: arr
# data structure: 




#  array = [[1,2,3],
#           [4,5,6],
#           [7,8,9]]

array = [[1,2,3],[4,5,6],[7,8,9]]
snail(array) #=> [1,2,3,6,9,8,7,4,5]