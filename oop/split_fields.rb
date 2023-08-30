=begin
Write a method that returns all of the fields in a haphazardly formatted string. 
A variety of spaces, tabs, and commas separate the fields, with possibly multiple occurrences of each delimiter.

Str.split method with regex... just s+?
=end

def fields(str)
  p str.split(/[ \t,]+/)
end


#Test cases


fields("Pete,201,Student") #,
# -> ["Pete", "201", "Student"]

fields("Pete \t 201    ,  TA") #tabs and multiple spaces/indent/comma
# -> ["Pete", "201", "TA"]

fields("Pete \t 201") # no commas but spaces/tab
# -> ["Pete", "201"]

fields("Pete \n 201") #
# -> ["Pete", "\n", "201"]