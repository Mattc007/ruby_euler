# The 5-digit number, 16807=7**5, is also a fifth power. Similarly, the 9-digit number, 
# 134217728=8**9, is a ninth power.

# How many n-digit positive integers exist which are also an nth power?

t1 = Time.now
solution = 0
lower_bound = 0
n = 1
 
while lower_bound < 10
  lower_bound = (10**((n-1.0)/n)).ceil
  solution += 10 - lower_bound
  n += 1
end

puts "found #{solution} in #{Time.now - t1}s"
# found 49 in 2.9e-05s
