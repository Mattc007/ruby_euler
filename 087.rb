# The smallest number expressible as the sum of a prime square, prime cube, 
# and prime fourth power is 28. In fact, there are exactly four numbers below 
# fifty that can be expressed in such a way:

# 28 = 2^2 + 2^3 + 2^4
# 33 = 3^2 + 2^3 + 2^4
# 49 = 5^2 + 2^3 + 2^4
# 47 = 2^2 + 3^3 + 2^4

# How many numbers below fifty million can be expressed as the sum of a prime 
# square, prime cube, and prime fourth power?

require 'prime'

t1 = Time.now
limit = 50_000_000
primes = Prime.first((limit**(0.5)).to_i)
solutions = {}

primes.each do |prime_square|
  prime_square = prime_square**2
  break if prime_square > limit

  primes.each do |prime_cube|
    prime_cube = prime_cube**3
    break if prime_cube > limit

    primes.each do |prime_fourth|
      prime_fourth = prime_fourth**4
      sum = prime_square + prime_cube + prime_fourth
      break if sum > limit
      solutions[sum] = 1
    end
  end
end

puts "found #{solutions.length} in #{Time.now - t1}s"
# found 1097343 in 0.995575s
