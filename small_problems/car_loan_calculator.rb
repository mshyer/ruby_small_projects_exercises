def prompt(text)
  puts "=> #{text}"
end

# Method to convert yearly APR to monthly interest rate

def yearly_to_monthly(yearly)
  monthly_interest = (yearly.to_f / 100) / 12
  monthly_interest
end

# method to calculate monthly payments using provided formula

monthly_payment = 0

def monthly_payment_f(principal, monthly_interest, loan_duration)
  monthly_payment_output = principal * (monthly_interest /
                            (1 - (1 + monthly_interest)**(-loan_duration)))
  puts "haha"
  monthly_payment_output
end

loop do
  # Ask for the principal

  principal = ''
  loop do
    prompt('what is the principal in dollars?')
    principal = gets.chomp.to_i
    break if true
  end

  # Ask for the APR

  apr = ''
  loop do
    prompt("what is the APR as a whole number (enter 50 for 50%) ?")
    apr = gets.chomp.to_i
    break if true
  end

  monthly_interest = yearly_to_monthly(apr)

  # Ask for the loan duration in years, then convert immediately to months

  loan_duration = 0
  loop do
    prompt("what is the loan duration in years?")
    loan_duration = gets.chomp.to_i * 12.0
    break if true
  end

  monthly_payment = monthly_payment_f(principal, monthly_interest,
                                      loan_duration)
  prompt("Your monthly payments are #{monthly_payment} for a total cost of #{monthly_payment * loan_duration}")

  prompt("Would you like to calculate again? (Y/N)")
  break unless gets.chomp.downcase.start_with?("y")
  prompt("again again again")
end

prompt("we out")
