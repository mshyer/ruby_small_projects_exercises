HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
# minutes/60 = hours minutes % 60 = minutes
require 'pry'
def time_of_day(user_input_int)
  user_input_int -= 1440 until user_input_int <= 1440
  user_input_int += 1440 until user_input_int > -1440
  hour, minutes = user_input_int.abs.divmod(60)
  case user_input_int <=> 0
  when 1
    "#{format('%#02d', hour)}:#{format('%#02d', minutes)}"
  when -1
    minutes != 0 ? "#{format('%#02d', 23 - hour)}:#{format('%#02d', 60 - minutes)}" :
                   "#{format('%#02d', 23 - hour)}:#{format('%#02d', minutes)}"
  when 0
    "00:00"
  end
end

def time_string_to_int_arr(time_string) ## 12:04 -> [12, 4]
  string_arr = time_string.split(":")
  int_arr = string_arr.map(&:to_i)
  int_arr
end
time_string_to_int_arr("12:03")

def before_midnight(time_string)
  return 0 if time_string == "00:00"
  int_arr = time_string_to_int_arr(time_string)
  minutes_total = (((24 - int_arr[0])* 60) - int_arr[1])
  p minutes_total
  minutes_total
  #binding.pry
end

def after_midnight(time_string)
  return 0 if time_string == "24:00"
  int_arr = time_string_to_int_arr(time_string)
  minutes_total = ((int_arr[0] * 60) + int_arr[1])
  p minutes_total
  minutes_total
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
# time_of_day(180)
# time_of_day(90)
# time_of_day(-110)
# time_of_day(0)
# p time_of_day(3000)
# p time_of_day(-3000)
# p time_of_day(-4231) == "01:29"



# iterate through HOURS
# subtract 60 from input each iteration and move one index forward until value <= 60 
# Then return Hour + Minutes

# HOURS = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
# def time_of_day(int)
#   user_input_number = int
#   index = 0
#   case user_input_number <=> 0
#   when 1
#     loop do
#       break if user_input_number < 60
#       index += 1
#       user_input_number -= 60
#     end
#   when -1
#     loop do
#       break if user_input_number > -60
#       index -= 1
#       user_input_number += 60
#     end
#     user_input_number = (60-user_input_number.abs)
#     index -= 1
#   when 0
#   end
#   if index > HOURS.length
#     index = index % 24
#   elsif index < HOURS.length
#     index = index % 24
#   end 
#   p "#{sprintf("%#02d", HOURS[index])}:#{sprintf("%#02d", user_input_number)}"
# end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"