ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
NUMBERS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]



def random_sample
  random_number = NUMBERS.sample
  random_letter = ALPHABET.sample
  random_sample_char = [random_number, random_letter].sample
  random_sample_char.to_s
end
sections = [8, 4, 4, 4, 12]
uuid_string = ""
counter = 0

sections.each_with_index do |number|
  number.times do 
    uuid_string << random_sample
  end
  counter += 1
  uuid_string << "-" unless counter == (sections.count)
end

# def uuid
#   uuid_string = ""
#   32.times do
#     uuid_string << random_sample
#   end
#   uuid_string
# end

p uuid_string
