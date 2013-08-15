=begin

A perfect number is a number for which the sum of its proper divisors is exactly 
equal to the number. For example, the sum of the proper divisors of 28 would 
be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and 
it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number
 that can be written as the sum of two abundant numbers is 24. By mathematical analysis, 
 it can be shown that all integers greater than 28123 can be written as the sum of two 
 abundant numbers. However, this upper limit cannot be reduced any further by analysis 
 even though it is known that the greatest number that cannot be expressed as the 
 sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two 
abundant numbers.

=end

require 'set'

def factor(n)
  factors = []
  (1..(n**0.5+0.5).to_i).each do |x|
    if n % x == 0
      factors.push(x) 
      factors.push(n/x)
    end
  end

  factors.uniq.sort[0..-2]
end

def is_abundant(n)
  factor(n).reduce(:+) > n
end

t1 = Time.now
upper_limit = 28123

abundant_numbers = []
(12..upper_limit).each do |x|
  abundant_numbers.push(x) if is_abundant(x)
end

sums_of_two_abundant_numbers = []
abundant_numbers.each do |x|
  abundant_numbers.each do |y|
    sums_of_two_abundant_numbers.push(x + y)
  end
end

non_abundant = (12..upper_limit).to_set.subtract(sums_of_two_abundant_numbers.uniq)

puts "found #{non_abundant.reduce(:+)} in #{Time.now - t1}s"

# found 4179805 in 19.420529s

