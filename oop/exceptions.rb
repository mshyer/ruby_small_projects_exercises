
def fail
  "a" + 1
  a + 1
  "n" + "n"
  puts yomama
end

begin
  fail
rescue StandardError => e   # storing the exception object in e
  puts e.message            # output error message
  puts e.class
end

puts "no problema"

class ValidateAgeError < StandardError; end

def validate_age(age)
  raise ValidateAgeError, "invalid age" unless (0..105).include?(age)
end

RETRY_LIMIT = 5
def ask_for_age
  attempts = 0
  begin
    attempts += 1
    puts "gimme an age, any age"
    user_input = gets.chomp.to_i
    validate_age(user_input)
  rescue ValidateAgeError => e
    puts e.message              #=> "invalid age"
    retry if attempts < RETRY_LIMIT
  end
end

a = ask_for_age

puts "is working?"

# puts yomama

# puts "problema"