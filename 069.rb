# Euler's Totient function, φ(n) [sometimes called the phi function], is used to determine 
# the number of numbers less than n which are relatively prime to n. For example, as 1, 2, 
# 4, 5, 7, and 8, are all less than nine and relatively prime to nine, φ(9)=6.

# It can be seen that n=6 produces a maximum n/φ(n) for n ≤ 10.

# Find the value of n ≤ 1,000,000 for which n/φ(n) is a maximum.

require 'prime'

t1 = Time.now
limit = 1_000_000
result = 2
i = 1
primes = Prime.first(10)

while result * primes[i] < limit
  result *= primes[i]
  i += 1
end

puts "found #{result} in #{Time.now - t1}s"
# found 510510 in 0.000106s

