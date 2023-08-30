#build a array reduce method from scratch

#
def reduce(arr, acc = nil)
  acc ||= arr.shift
  arr.each do |ele|
    acc = yield(acc, ele)
  end
  
  acc
end



array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
#reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass


p [1,2,3,4,5].reduce{|acc, n| acc * n}

p reduce(['a', 'b', 'c']) { |acc, value| acc + value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']