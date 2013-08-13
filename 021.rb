=begin

Let d(n) be defined as the sum of proper divisors of n (numbers less than n which 
divide evenly into n).

If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each 
of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.

=end

def factor(n)
  factors = []
  (1..(n**0.5+0.5).to_i).each do |x|
    if n % x == 0
      factors.push(x) 
      factors.push(n/x)
    end
  end

  return factors.uniq.sort[0..-2]
end

def is_amicable(n)
  q = factor(n).inject(:+)
  factor(q).inject(:+) == n &&  q != n
end

t1 = Time.now
amicable_numbers = []
(2..10000).each do |x|
  amicable_numbers.push(x) if is_amicable(x)
end

puts "#{amicable_numbers.inject(:+)} found in #{Time.now - t1}s"

# 31626 found in 0.557292s
