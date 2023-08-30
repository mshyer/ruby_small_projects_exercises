
def time_of_day
  light_status = [true, false].sample
  # print "it's daytime!" if light_status
  # print "it's nighttime!" if !light_status
  puts light_status ? 'It\'s daytime!' : 'It\'s nighttime!'
end

time_of_day
time_of_day
time_of_day
time_of_day
time_of_day