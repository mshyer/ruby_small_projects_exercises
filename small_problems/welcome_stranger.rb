def greetings(name_arr, hash = { title: 'Master', occupation: "Employee" })
  name = name_arr.join(" ")
  puts "Hello #{name}, so nice to have a " \
       "#{hash[:title]} #{hash[:occupation]} around here."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
