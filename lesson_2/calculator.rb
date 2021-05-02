def prompt(message)
  puts("=> #{message}")
end

def valid_number?(number)
  number.to_i != 0
end

def number_input(number_word)
  number = ""
  loop do
    prompt("What's the #{number_word} number?")
    number = gets.chomp
    if valid_number?(number)
      number = number.to_i
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end
  return number
end

def operation_to_message(op)
  case op
  when "1"
    "Adding"
  when "2"
    "Subtracting"
  when "3"
    "Multiplying"
  when "4"
    "Dividing"
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = ""
loop do
  name = gets.chomp

  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hello #{name}")

loop do
  # main loop
  num1 = number_input("first")

  num2 = number_input("second")

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ""
  loop do
    operator = gets.chomp
    if %w[1 2 3 4].include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =
    case operator
    when "1"
      num1 + num2
    when "2"
      num1 - num2
    when "3"
      num1 * num2
    when "4"
      num1.to_f / num2.to_f
    end

  prompt("The result is: #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for using the calculator. Goodbye!")
