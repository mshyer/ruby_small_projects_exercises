def minilang(command_string)
  stack = []
  commands_arr = command_string.split(" ").to_a
  register = 0
  commands_arr.each do |command|
    case command
    when /[1-9]/i then register = command.to_i
    when "PUSH" then stack << register
    when "ADD" then register += stack.pop
    when "SUB" then register -= stack.pop
    when "MULT"then register *= stack.pop
    when "DIV" then register /= stack.pop
    when "MOD" then register %= stack.pop
    when "POP" then register = stack.pop
    when "PRINT" then puts register
    end
  end
end

# minilang("3 PUSH 5 PUSH 7 PUSH 5 PUSH 4 PUSH 3 PUSH")
# [3 5 
# POP MOD

# 7 3 5 4]
minilang("3 PUSH 5 PUSH POP MOD4 PUSH 5 PUSH 3 PUSH 7 PUSH POP MULT ADD SUB DIV PRINT")
          
# (3 + (4 * 5) - 7) / (5 % 3)
