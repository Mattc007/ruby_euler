# The prime 41, can be written as the sum of six consecutive primes:

# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.

# The longest sum of consecutive primes below one-thousand that adds to a prime, 
# contains 21 terms, and is equal to 953.

# Which prime, below one-million, can be written as the sum of the most consecutive primes?

require 'prime'

t1 = Time.now
prime_result = 1
primes = []
prime_sum = [0]
number_of_primes = 0
limit = 1_000_000

i = 0
Prime.each do |p|
  break if p > limit
  primes.push(p)
  prime_sum[i + 1] = prime_sum[i] + p
  i += 1
end

(number_of_primes..prime_sum.length - 1).each do |i|
  (i - number_of_primes - 1).downto(0).each do |j|
    break if limit < prime_sum[i] - prime_sum[j]

    if primes.include?(prime_sum[i] - prime_sum[j])
      number_of_primes = i - j
      prime_result = prime_sum[i] - prime_sum[j]
    end
  end
end

puts "found #{prime_result} with #{number_of_primes} in #{Time.now - t1}s"
# found 997651 with 543 in 9.258908s
