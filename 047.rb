# The first two consecutive numbers to have two distinct prime factors are:

# 14 = 2 × 7
# 15 = 3 × 5

# The first three consecutive numbers to have three distinct prime factors are:

# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.

# Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?

require 'mathn'

t1 = Time.now

value = (210..1.0/0.0).lazy.each_cons(4).detect { |nums| 
  nums.all? { |n| n.prime_division.length == 4 } 
}.first

puts "found #{value} in #{Time.now - t1}s"
# found 134043 in 4.592545s
