def each_with_index(array)
  i = 0
  loop do
    yield(array[i], i)
    i += 1
    break if i == array.length
  end
  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]