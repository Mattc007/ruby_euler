=begin

n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!

=end

def sum_factorial_digits(number)
  100.downto(1).inject(:*).to_s.split('').map(&:to_i).inject(:+)
end

t1 = Time.now
puts "found #{sum_factorial_digits(100)} in #{Time.now - t1}s"

# found 648 in 0.000327s