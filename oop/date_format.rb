# PART ONE
# Solution #2 (solution 1 at bottom in comment)
# Use sub plus capture groups


def format_date(text)
  text.sub(/(\d\d\d\d)-(\d\d)-(\d\d)/, '\3.\2.\1')
end

#test cases:
# p format_date('2016-06-17') # -> '17.06.2016'
# p format_date('2016/06/17') # -> '2016/06/17' (no change)




##PART TWO
#Method should do either dashes or slashes to periods

def reformat_date(text)
  #text.sub(/(\d\d\d\d)([-\/])(\d\d)\2(\d\d)/, '\4.\3.\1')
  text.sub(/(\d\d\d\d)-(\d\d)-(\d\d)/, '\3.\2.\1')
      .sub(/(\d\d\d\d)\/(\d\d)\/(\d\d)/, '\3.\2.\1')
end
p reformat_date('2016-06-17') # -> '17.06.2016'
p reformat_date('2017/05/03') # -> '03.05.2017'
p reformat_date('2015/01-31') # -> '2015/01-31' (no change)



=begin
Method converts dates in format yyyy/mm/dd to dd/mm/yyyy. 
It should work only for dashes and change the divider to periods
Input: str
Output: str
Algorithm: 
1. Split string into array of just the digits (no separators)
  split /-/
2. join the date according to: (MM:DD) + (YY) concatenation


# def format_date(date_str)
#   date_arr = date_str.split(/-/)
#   if date_arr.length > 1
#     p ([date_arr[2]] + [date_arr[1]] + [date_arr[0]]).join(".")
#   else
#     p date_str
#   end
# end
=end