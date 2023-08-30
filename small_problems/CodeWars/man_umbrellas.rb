=begin
12
A man walks to and from work. He's kind of silly, so he doesn't bring the umbrella back home unless it is raining.
How many umbrellas does he need to not get wet given an array of upcoming weather forecasts?
weather = ["clear", "sunny", "cloudy", "rainy", "windy" or "thunderstorms".] => 2
              no      no        no      UMB        no        UMB
              0                          1                    2

minUmbrellas(["rainy", "clear", "rainy", "cloudy"])
// should return 2
// Because on the first morning, he needs an umbrella to take, and he leaves it at work.
// So on the second morning, he needs a second umbrella.

minUmbrellas(["sunny", "windy", "sunny", "clear"])
// should return 0
// Because it doesn't rain at all

minUmbrellas(["rainy", "rainy", "rainy", "rainy", "thunderstorms", "rainy", rain, sun])
// should return 1
// Because he only needs 1 umbrella which he takes on every journey.
                1         -1      1         -1        1               -1      1     0
                0         -1      0          -1
Input: array of strings
Output: integer

Data structure: 2 arrays holding umbrellas at each location plus counter variable

Algorithm:
init weather events hash constant
init counter umbrellas = 0
init umbrellas array at home []
init umbrellas array at work []
iterate through the input array, 
if input value is 1
  if index is even and umbrellas at home is empty
    counter plus 1
    add 1 to work array
  if index is even and umbrellas at home is not empty,
    remove 1 from home array
    add 1 to work array
  if index is odd and umbrellas at work is empty
    counter plus 1
    add 1 to home array
  if index is odd and umbrellas at work is not empty,
    remove 1 from work array
    add 1 to home array
return the counter variable
=end



WEATHER_EVENTS = {"clear" => 0, "sunny" => 0, "cloudy" => 0, "rainy" => 1, "windy" => 0, "thunderstorms" => 1}

def minUmbrellas(input_events)
  umb = 0
  home_umb = []
  work_umb = []
  input_events.each_with_index do |event, idx|
    if WEATHER_EVENTS[event] == 1 && idx.even?
      if home_umb.empty?
        umb += 1
        work_umb << 1
      else
        work_umb << home_umb.shift
      end
    end
    if WEATHER_EVENTS[event] == 1 && idx.odd?
      if work_umb.empty?
        umb += 1
        home_umb << 1
      else
        home_umb << work_umb.shift
      end
    end
  end
  umb
end



p minUmbrellas(["sunny", "windy", "sunny", "clear"])
p minUmbrellas(["rainy", "rainy", "rainy", "rainy", "thunderstorms", "rainy"])
p minUmbrellas(["rainy", "clear", "rainy", "cloudy"])

p minUmbrellas(["thunderstorms", "thunderstorms", "sunny", "sunny", "rainy", "sunny", "thunderstorms", "windy", "cloudy", "rainy", "windy", "rainy", "thunderstorms", "rainy", "thunderstorms", "windy", "windy", "thunderstorms", "sunny", "rainy", "sunny", "rainy", "rainy", "rainy", "sunny", "sunny"])