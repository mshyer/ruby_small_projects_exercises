def leap_year?(year)
  if gregorian?(year)
    if year % 4 == 0 && (year % 100 != 0) || year % 400 == 0
      true
    else 
      false
    end
  else
    year % 4 == 0
  end
end

def gregorian?(year)
  year >= 1752
end

a = 
[
  leap_year?(2016) == true,
  leap_year?(2015) == false,
  leap_year?(2100) == false,
  leap_year?(2400) == true,
  leap_year?(240000) == true,
  leap_year?(240001) == false,
  leap_year?(2000) == true,
  leap_year?(1900) == false,
  leap_year?(1752) == true,
  leap_year?(1700) == true,
  leap_year?(1) == false,
  leap_year?(100) == true,
  leap_year?(400) == true
]
p a