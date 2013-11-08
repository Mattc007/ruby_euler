# Euler's Totient function, φ(n) [sometimes called the phi function],
# is used to determine the number of positive numbers less than or equal 
# to n which are relatively prime to n. For example, as 1, 2, 4, 5, 7, 
# and 8, are all less than nine and relatively prime to nine, φ(9)=6.
# The number 1 is considered to be relatively prime to every positive 
# number, so φ(1)=1.

# Interestingly, φ(87109)=79180, and it can be seen that 87109 is a 
# permutation of 79180.

# Find the value of n, 1 < n < 10**7, for which φ(n) is a permutation 
# of n and the ratio n/φ(n) produces a minimum.

require 'prime'

t1 = Time.now
upper_limit = 10**7
solution = 1
min_ratio = upper_limit + 1

# we need all primes between 2000 & 5000 
primes = Prime.first(700) - Prime.first(300)

primes.each do |p1|
  primes.each do |p2|
    next if p2 < p1
    
    n = p1 * p2
    break if n > upper_limit
    phi = (p1 - 1) * (p2 - 1)
    ratio = (n * 1.0) / phi

    if n.to_s.chars.sort.join == phi.to_s.chars.sort.join \
       && min_ratio > ratio
      solution = n
      min_ratio = ratio
    end
  end
end

puts "found #{solution} in #{Time.now - t1}s"
# found 8319823 in 0.210293s
