# The sum of the squares of the first ten natural numbers is,
#
# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
#
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first ten 
# natural numbers and the square of the sum is 3025 - 385 = 2640.
# 
# Find the difference between the sum of the squares of the first one hundred 
# natural numbers and the square of the sum.

n = 100

# formula
ta_1 = Time.now
sum_of_squares = n**2 * (n+1)**2 * 1/4
square_of_sum = n * (n+1) * (2*n+1) * 1/6
result_a = sum_of_squares - square_of_sum
delta_a = Time.now - ta_1

# brute force
tb_1 = Time.now
sum_of_squares = 0
square_of_sum = 0

(1..100).each do |x|
  sum_of_squares += x**2
  square_of_sum += x
end

result_b = square_of_sum**2 - sum_of_squares
delta_b = Time.now - tb_1

# output
p "formula method result = #{result_a} found in #{delta_a}s"
p "brute force method result = #{result_b} found in #{delta_b}s"

p "brute force took #{delta_b / delta_a} times longer"