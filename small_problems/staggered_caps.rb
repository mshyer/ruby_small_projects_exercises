LETTERS = ("a".."z").to_a + ("A".."Z").to_a
def staggered_case(str, boolean_case = false)
  str.chars.map do |char|
    if LETTERS.include?(char)
      boolean_case = !boolean_case
      !!boolean_case ? char.upcase : char.downcase
    else
      char
    end
  end.join("")
end
  # swapped = str.chars.each_with_index do |char, i|
  #   i.even? ? char.upcase! : char.downcase!
  # end.join("")
  # !!upcase ? swapped : swapped.swapcase


p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'