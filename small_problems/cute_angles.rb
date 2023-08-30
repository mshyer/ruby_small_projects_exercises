DEGREE = "\xC2\xB0"

def dms(fp_number)
  if fp_number > 360 || fp_number < 0
    fp_number = fp_number % 360
  end
  degrees, minutes = fp_number.divmod(1)
  minutes = 60 * minutes
  minutes, seconds = minutes.divmod(1)
  seconds = 60 * seconds
  "#{sprintf("%#02d", degrees)}#{DEGREE}#{sprintf("%#02d", minutes)}'#{sprintf("%#02d", seconds)}\""
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

p dms(400) #== %(40°00'00")
p dms(-40) #== %(320°00'00")
p dms(-420) #== %(300°00'00")