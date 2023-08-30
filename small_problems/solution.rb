def sum_even_number_row(row_number)
  counter_a = 2
  counter_b = 1
  row = []
  row_number.times do
    row = create_row(counter_a, counter_b)
    counter_b += 1
    counter_a = (row.last + 2)
  end
  row.sum
end

def create_row(start_integer, row_length)
  row = []
  counter = start_integer
    row_length.times do
      row << counter
      counter += 2
    end
  row
end

p sum_even_number_row(1) == 2
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68

p create_row(2, 1) == [2]
p create_row(4, 2) == [4, 6]
p create_row(8, 3) == [8, 10, 12]