def twice(int)
  num_s = int.to_s
  length = num_s.length
  case length.odd?
  when true
  int * 2
  when false
    if num_s[0..((length / 2) - 1)] == num_s[(length / 2)..]
      int
    else
    int * 2
    end
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10