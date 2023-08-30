#build an array select method from scratch

#With yield
def select(arr)
  output = []
  i = 0
  while i < arr.length
    output << arr[i] if yield(arr[i]) 
    i += 1
  end

  output
end

greater_than_2 = select([1,2,3,4,5,6]) {|n| n > 2}
p greater_than_2

#With an explicit parameter

def select2(arr, &proc)
  output = []
  i = 0
  loop do
    output << arr[i] if proc.call(arr[i])
    i += 1
    break if i == arr.length
  end

  output
end

odds = select2([1,2,3,4,5,6]) {|n| n.odd?}
p odds

#using arr each

def select3(arr)
  output = []
  arr.each do |element|
    output << element if yield(element)
  end

  output
end

putses = select3([1,2,3,4,5,6]) {|n| puts n}
p putses

palindromes = select3(["aha", "jjsss", "aja"]) {|n| n == n.reverse}
p palindromes