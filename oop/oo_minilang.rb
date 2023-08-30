=begin
A minilang class takes a string of commands as input, interprets them as commands, and outputs based on the commands
Problem: 
Class Minilang 
Initialize:
Register: nil
Stack: Empty array


use object send method

Class 

Methods:

n Place a value n in the "register". Do not modify the stack.
  if str =~ /\A[-+]?\d+\z/
    puts "It's a number!"
  else
    puts "It's not a number."
  end
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value

=end
class MinilangError < StandardError ; end
class BadTokenError < MinilangError ; end
class NoStackError < MinilangError ; end

module Commands

  def n(value)
    self.register = value
  end

  def push
    stack << register
  end

  def add
    self.register += clean_pop
  end

  def sub
    self.register -= clean_pop
  end

  def mult
    self.register *= clean_pop
  end

  def div
    self.register /= clean_pop
  end

  def mod
    self.register %= clean_pop
  end

  def pop
    raise NoStackError, "Empty Stack!" if stack.empty?
    self.register = stack.pop
  end

  def clean_pop
    raise NoStackError, "Empty Stack!" if stack.empty?
    stack.pop
  end

  def print
    puts register
  end
  
end

class Minilang
  include Commands
  attr_accessor :register, :stack, :input_string, :commands

  ACTIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(input_string)
    @input_string = input_string
    @commands = input_string.split(" ")
    @register = 0
    @stack = []
  end

  def eval(optional = nil)
    if optional
      converted_optional = format(input_string, optional)
      self.commands = converted_optional.split(" ")
    end
    @commands.each{ |command| interpret(command) }
  end

  private

  def interpret(command)
    if ACTIONS.include?(command)
      send command.downcase
    elsif command =~ /\A[-+]?\d+\z/
      n(command.to_i)
    else
      raise BadTokenError, "Invalid token! #{command}" 
    end
  end
end
  #   if command =~ /\A[-+]?\d+\z/
  #     n(command.to_i)
  #     return
  #   end
  #   begin
  #     case command
  #     when "PUSH" then send :lang_push
  #     when "ADD" then send :add
  #     when "SUB" then send :subtract
  #     when "MULT" then send :multiply
  #     when "DIV" then send :divide
  #     when "MOD" then send :mod
  #     when "POP" then send :lang_pop
  #     when "PRINT" then send :lang_print
  #     else raise(BadTokenError, "Invalid Token")
  #     end
  #   rescue TypeError => error
  #     puts "oh no"
  #     puts error.message
  #   end
  # end

minilang = Minilang.new("PUSH").eval

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100)
# 212
minilang.eval(degrees_c: 0)
# 32
minilang.eval(degrees_c: -40)
# -40