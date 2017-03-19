# Mortgage/car loan calculator
# Data needed: loan amount, Annual Percentage Rate APR, loan duration
# Calculate monthly interest rate and loan duration in months
# formula m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months
def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
    
  puts('Welcome to Mortgage/Car Loan Calculator')
  puts
  prompt('Enter the loan amount') 
  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    if loan_amount.empty? || loan_amount.to_i < 0
      prompt('Please enter a valid loan amount')
    else
      break
    end
  end
  
  prompt("The loan amount is #{loan_amount}")
  prompt('Enter the APR')
  prompt('Example: For 2.5% enter 2.5')
  
  apr = ''
  loop do
    apr = gets.chomp
    if apr.empty? || apr.to_f < 0
      prompt("Please enter a valid APR (Must be a positive number)")
    else
      break
    end
  end
  
  prompt("The apr is #{apr}%")
  
  prompt('Enter the loan duration in months')
  loan_duration_months = ''
  
  loop do
    loan_duration_months = gets.chomp
    if loan_duration_months.empty? or loan_duration_months.to_i < 0
      prompt('Enter a valid loan duration')
    else
      break
    end
  end
  
  puts "The loan duration is #{loan_duration_months} years"
  annual_interest_rate = apr.to_f / 100
  #change j to montly_interest_rate
  monthly_interest_rate = annual_interest_rate / 12
  
  puts "annual_interest_rate is #{annual_interest_rate}"
   
  monthly_payment = loan_amount.to_f * 
    (monthly_interest_rate.to_f / (1 - (1 + monthly_interest_rate.to_f)**(-loan_duration_months.to_i)))
  puts "The monthly payment is #{monthly_payment}"
  puts "The total amount paid will be #{loan_duration_months.to_i * monthly_payment.to_f}"
  prompt("Another calculation?")
  answer = gets().chomp()

  break unless answer.downcase().start_with?('y')
  
end