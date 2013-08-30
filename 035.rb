# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, 
# are themselves prime.

# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

# How many circular primes are there below one million?

require 'prime'

t1 = Time.now

ceiling = 1_000_000
circular_primes_count = 0
primes = []
n = 1

Prime.take_while { |p| p < ceiling }.each do |x| 
  x_array = x.to_s.split('')
  all_prime = true
  x_array.length.times do 
    break unless all_prime
    x_array.rotate!
    all_prime = Prime.prime?(x_array.join('').to_i)
  end
  circular_primes_count += 1 if all_prime
end

puts "found #{circular_primes_count} in #{Time.now - t1}s"

# found 55 in 9.458618s