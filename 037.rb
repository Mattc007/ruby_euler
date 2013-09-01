# The number 3797 has an interesting property. Being prime itself, it is possible to 
# continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, 
# and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

require 'prime'

t1 = Time.now

found = 0
i = 10
results = [3, 7]
prefixes = [1, 2, 3, 5, 7, 9] # putting a 0, 4, 6 or 8 before a digit makes it not right truncatable
sum = 0

while found < 11
  candidate = results.shift
  if Prime.prime?(candidate)
    is_truncatable = true
    n = candidate
    power = 1

    while n > 0
      is_truncatable = Prime.prime?(n) && is_truncatable
      n /= 10
      power *= 10
    end

    if is_truncatable && candidate > 10
      sum += candidate
      found += 1
    end

    prefixes.each do |p|
      results.push(power * p + candidate)  # builds a list of only left truncatable primes
    end
  end
end

puts "found #{sum} in #{Time.now - t1}s"

# found 748317 in 0.015725s