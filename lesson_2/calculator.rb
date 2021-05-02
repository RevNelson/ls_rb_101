require("./calculator_messages.rb")

LANGUAGE = "en"

operation_message = {
  "1" => "adding",
  "2" => "subtracting",
  "3" => "multiplying",
  "4" => "dividing"
}

name = ""

def prompt(message, before = nil, after = nil)
  puts(
    "=> #{before ? "#{before} " : ""}#{MESSAGES[message] ? MESSAGES[message][LANGUAGE] : message}#{after ? " #{after}" : ""}"
  )
end

def valid_number?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
end

def number_input(message)
  number = ""
  loop do
    prompt(message)
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

prompt("welcome")

loop do
  name = gets.chomp

  if name.empty?
    prompt("invalid_name")
  else
    break
  end
end

prompt("hello", nil, name)

loop do
  # main loop
  num1 = number_input("enter_num1")

  num2 = number_input("enter_num2")

  prompt("operator_prompt")

  operator = ""
  loop do
    operator = gets.chomp
    if %w[1 2 3 4].include?(operator)
      break
    else
      prompt("invalid_operation")
    end
  end

  prompt(operation_message[operator])

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

  prompt("result_prefix", nil, result)

  prompt("calculate_again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("goodbye")
