LOWERCASE = ("a".."z").to_a
UPPERCASE = ("A".."Z").to_a

def letter_percentages(str)
  total = str.length.to_f
  lower = str.count(LOWERCASE.join(""))
  upper = str.count(UPPERCASE.join(""))
  neither = total - (lower + upper)
  counter_hash = {lowercase: ((lower / total) * 100).round(1), uppercase: (upper / total) * 100, neither: (neither / total) * 100}
  p counter_hash
end

p letter_percentages('abcdefGHI') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
