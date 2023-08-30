#each method implementation

#With yield
def each(arr)
  i = 0
  loop do
    yield(arr[i])
    i += 1
    break if i == arr.length
  end

  arr
end

a = (each([1,2,3,4]) do |n|
  puts n
end)
p a

#With proc explicit argument

def each2(arr, &proc)
  i = 0
  while i < arr.length
    proc.call(arr[i])
    i += 1
  end

  arr
end


b = (each2([7,8,9,"ten"]) do |n|
  puts n
  puts n.to_i + 7
  puts "wheeee #{n}"
end)

p b