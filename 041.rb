# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n 
# exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

# What is the largest n-digit pandigital prime that exists?

#  a number is divisible by 3 if and only if the digit sum of the number is divisible by 3

require 'prime'

def pandigital?(n)
  digits = 0
  count = 0

  while n > 0
    q = digits
    digits = digits | 1 << ((n % 10) - 1)
    return false if q == digits
    count += 1
    n /= 10
  end
  
  digits == (1 << count) - 1 
end

t1 = Time.now

max_pandigital = 7654321
largest = 1

max_pandigital.downto(1).each do |n|
  if Prime.prime?(n) && pandigital?(n)
    largest = n 
    break
  end
end

puts "found #{largest} in #{Time.now - t1}s"
# found 7652413 in 0.116095s
