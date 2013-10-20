# It is possible to write ten as the sum of primes in exactly five different ways:

# 7 + 3
# 5 + 5
# 5 + 3 + 2
# 3 + 3 + 2 + 2
# 2 + 2 + 2 + 2 + 2

# What is the first value which can be written as the sum of primes in over five 
# thousand different ways?

require 'prime'

t1 = Time.now
target = 3
primes = Prime.first(100)

while true
  ways = []

  (target + 1).times { ways.push(0) }
  ways[0] = 1

  (0..primes.length-1).each do |i|
    (primes[i]..target).each do |j|
      ways[j] += ways[j - primes[i]]
    end
  end

  break if ways[target] > 5000

  target += 1
end

puts "found #{target} in #{Time.now - t1}s"
# found 71 in 0.006687s
