# Write a method that will take a short line of text, and print it within a box.

def print_in_box(input)
  if input.length > 74
    horizontal_rule = "+#{"-"*(44)}+"
    blank_space = "|#{' ' * (44)}|"
    p horizontal_rule
    p blank_space
    text_section(input)
    p blank_space
    p horizontal_rule
  else
    horizontal_rule = "+#{"-"*(input.length + 4)}+"
    blank_space = "|#{' ' * (input.length + 4)}|"
    p horizontal_rule
    p blank_space
    text_section(input)
    p blank_space
    p horizontal_rule
  end
end

def split_text(input_text)
  arr = []
  range1 = 0
  range2 = 39
  str_copy = input_text.clone
  while str_copy.length > 39
      arr << str_copy.slice!(range1..range2)
  end
  arr << str_copy
  arr
end

def text_section(text)
  text_arr = []
  if text.length > 74
    text_arr = split_text(text)
    text_arr.each do |text_string|
      if text_string.length == 40
        p "|  #{text_string}  |"
      else
        p "|  #{text_string}" + (" " * (40 - text_string.length)) + "  |"
      end
    end
  else
    p "|  #{text}  |"
  end
end

print_in_box('To boldly go where no one has gone before.')

print_in_box("Lorem ipsum dolor sit amet, consectetur adipiscing elit," +
             "sed do eiusmod tempor incididunt ut labore et dolore mag" +
             "na aliqua. Ut, enim ad minim veniam, quis nostrud exerci" +
             "tation ullamco laboris nisi ut aliquip ex ea commodo con" +
             "sequat. Duis aute irure dolor in reprehenderit in volupt" +
             "ate velit esse cillum dolore eu fugiat nulla pariatur. E" +
             "xcepteur sint occaecat cupidatat non proident, sunt in c" +
             "ulpa qui officia deserunt mollit anim id est laborum.")
# def spacing(text)
#   output_text = ""
#   (text.length + 4).times {output_text << " "}
#   output_text
# end

# def words(text)
#   "  #{text}  "
# end

# def dashes(text)
#   output_text = ""
#   (text.length + 4).times {output_text << "-"}
#   output_text
# end





  # text = "|  #{input}  |"
  # p horizontal_rule
  # p blank_space
  # text_section(input)
  # p blank_space
  # p horizontal_rule
  # p "+-#{dashes(input)}-+"
  # p "| #{spacing(input)} |"
  # p "| #{words(input)} |"
  # p "| #{spacing(input)} |"
  # p "+-#{dashes(input)}-+"
# end
