# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

# upper limit => 8 digits since 8 * 9! is a 7 digit number so 7 * 9!

t1 = Time.now

factorials = [1]
values = []

(1..9).each do |x|
  factorials[x] =  factorials[x - 1] * x
end

(3..7*factorials[9]).each do |y|
  sum = 0
  y.to_s.split('').each do |n|
    sum += factorials[n.to_i] 
  end
  values.push(y) if sum == y
end

puts "found #{values.inject(:+)} in #{Time.now - t1}"

# found 40730 in 30.416017
