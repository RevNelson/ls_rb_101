# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

puts("Welcome to Calculator! \n\n")

puts("What's the first number?")
num1 = gets.chomp.to_i
puts("The number is: #{num1}!")

puts("What's the second number?")
num2 = gets.chomp.to_i
puts("The number is: #{num2}!")

puts("What operation would you like to perform?")
puts("1) add 2) subtract 3) multiply 4) divide")
operator = gets.chomp

if operator == "1"
  result = num1 + num2
elsif operator == "2"
  result = num1 - num2
elsif operator == "3"
  result = num1 * num2
else
  result = num1.to_f / num2.to_f
end

puts("The result is: #{result}")
