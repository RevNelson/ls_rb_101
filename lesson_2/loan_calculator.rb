require "yaml"
MESSAGES = YAML.load_file("./loan_calculator_messages.yaml")

LANGUAGE = "en"

def prompt(message, after = nil)
  main_message = MESSAGES[message] ? MESSAGES[message][LANGUAGE] : message
  suffix = after ? " #{after}" : ""
  puts("=> #{main_message}#{suffix}")
end

def valid_number?(number)
  (number.to_i.to_s == number || number.to_f.to_s == number) && number.to_i > 0
end

def number_input(message)
  number = ""
  prompt(message)
  loop do
    number = gets.chomp
    if valid_number?(number)
      number = number.to_f
      break
    else
      prompt("invalid_number")
    end
  end
  number
end

loop do
  # main loop
  prompt("welcome")

  amount = number_input("enter_loan_amount")
  apr = number_input("enter_apr_amount")
  months = number_input("enter_loan_duration").to_i * 12

  monthly_apr = apr / 12 / 100

  monthly_payment = amount * (monthly_apr / (1 - (1 + monthly_apr)**(-months)))

  prompt("loan_amount", amount)

  prompt("apr_amount", apr)

  prompt("loan_duration", months / 12)

  prompt("result_prefix", monthly_payment)

  prompt("calculate_again?")
  answer = gets.chomp

  break unless answer.downcase.start_with?("y")
end

prompt("goodbye")
