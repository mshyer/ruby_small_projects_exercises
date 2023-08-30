require 'date'

def friday_13th(year)
  counter = 0
  thirteenth = Date.new(year, 1, 13)
  loop do
    counter += thirteenth.friday? ? 1 : 0
    thirteenth = thirteenth.next_month
    break if thirteenth.year != year
  end
  counter
end

def five_fridays_months(year)
  date = Date.new(year, 1, 1)
  five_fridays = 0
  12.times do
    fridays = 0
    old_date = date
    loop do
      fridays += 1 if date.friday?
      date = date.next_day
      break if date.month != old_date.month
    end
    five_fridays += 1 if fridays == 5 
  end
  five_fridays
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

p five_fridays_months(2020)
p five_fridays_months(2019)
p five_fridays_months(2016)
p five_fridays_months(1994)
p five_fridays_months(1945)

