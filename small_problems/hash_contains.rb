#program to determine if key is in hash

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

def hash_check(key, hash = {})
  hash.key?(key)
end

puts hash_check(:name, person)