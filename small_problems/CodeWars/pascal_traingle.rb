=begin
Input: TWO integers:  nth diagonal of traingle (integer) and Lth number 
Output: ARRAY of first l numbers of diagonal

Data structure: nested arrays

Algorithm:
1. Generate L + n rows
  a. Create ROWS array
  a. first row [1]
  b. second x[0] + x[-1]
  c. Then loop L-2 times 
    1. new_arr = [[1]]
    2. for each item in ROWS[-1] with index
      a. add sub_row[i] + sub_row[i + 1] to new array
    3. append trailing 1 to new array
    4. append new array to the output array
2. According to the digonal, append each appropriate number to an output array
  a. if row.index >= (n)
    1. diagonal_output << row[-L-1]
3. return output array

=end
require 'pry'

def generate_diagonal(n, l)
  rows = generate_rows(l + (n))
  #rows
  diagonal_output = []
  rows.each_with_index do |row, idx|
    if idx >= (n )
      diagonal_output << row[-n-1]
    end
  end
  diagonal_output
end

def generate_rows(l)
  rows = [[1], [1, 1]]
  (l-2).times do 
    new_row = [1]
    rows[-1].each_with_index do |_, idx|
      next if (idx + 1) == rows[-1].length
      new_row << (rows[-1][idx] + rows[-1][idx + 1])
    end
    new_row << 1
    rows << new_row
  end
  rows
end

#generate_rows(5)
p generate_diagonal(3, 5)
p generate_diagonal(3, 10)
p generate_diagonal(2, 10)
p generate_diagonal(2, 8)
p generate_diagonal(1, 8)