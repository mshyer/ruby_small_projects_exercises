def century(int)
  century = (int / 100) + 1
  "#{century}#{suffix(century)} Century"
end

def suffix(century)
  century_chars = century.to_s
  if ["11", "12", "13"].include?(century_chars[-2..-1])
    "th"
  elsif century_chars[-1] == "1"
    "st"
  elsif century_chars[-1] == "2"
    "nd"
  elsif century_chars[-1] == "3"
    "rd"
  else "th"
  end
end

p century(2021)
p century(50)
p century(1011)
