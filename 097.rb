# The first known prime found to exceed one million digits was discovered in 1999, and is a 
# Mersenne prime of the form 26972593−1; it contains exactly 2,098,960 digits. Subsequently 
# other Mersenne primes, of the form 2p−1, have been found which contain more digits.

# However, in 2004 there was found a massive non-Mersenne prime which contains 2,357,207 digits: 28433×27830457+1.

# Find the last ten digits of this prime number.

t1 = Time.now
modulo = 10_000_000_000

def modular_pow(base, exponent, modulus)
  c = 1
  exponent.times { c = (c * base) % modulus }
  c
end

puts "found #{((28433 * modular_pow(2, 7830457, modulo)) + 1) % modulo} in #{Time.now - t1}s"
# found 8739992577 in 2.412118s
