# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. 
# The program must compute the tip and then display both the tip and the total amount of the bill.

def prompt(string)
  puts "=> " + string
end

def tip(total, percent)
  if percent > 1.0
    (total * (percent/100)).round(2)
  elsif percent < 1
    (total * percent).round(2)
  else
    "impossible to calculate because there was a problem with the percentage"
  end
end 

prompt("Please enter the bill amount")
bill = gets.chomp.to_f

prompt("Please enter the tip percentage")
percentage = gets.chomp.to_f

instance_tip = tip(bill, percentage) 

prompt("The tip is $#{format("%.2f", instance_tip)}.")
prompt("The total is $#{format("%.2f", instance_tip + bill)}")