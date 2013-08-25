# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

# 9^5 = 59049 --> 9^5 requires 5 digits
# 5 * 9^5 = 295425 --> can produce a 6 digit number
# 6 * 9^5 = 354294 --> upper bound?

t1 = Time.now

solutions = []
upper_bound = 6 * 9**5

(2..upper_bound).each do |a|
  sum = 0
  a.to_s.split('').each do |x|
    sum += x.to_i**5
  end
  if a == sum
    solutions.push(a)
  end
end

puts "found #{solutions.inject(:+)} in #{Time.now - t1}s"

# found 443839 in 3.562169s