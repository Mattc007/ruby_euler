# It is possible to show that the square root of two can be expressed as an infinite continued fraction.

# √ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...

# By expanding this for the first four iterations, we get:

# 1 + 1/2 = 3/2 = 1.5
# 1 + 1/(2 + 1/2) = 7/5 = 1.4
# 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
# 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

# The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion, 1393/985, 
# is the first example where the number of digits in the numerator exceeds the number of digits in the denominator.

# In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator?

# 3/2 -> 7/5 -> 17/12 -> 41/29 -> ... -> n(k)/d(k) -> n(k+1)/d(k+1)
# pattern: n(k+1) = 2*d(k) + n(k); d(k+1) = n(k) + d(k) ==> d(k+1) = n(k+1) - d(k)

t1 = Time.now
limit = 1000
solution = 0
i = 1
d = 2
n = 3

while i < limit
  n += 2*d
  d = n - d
  if n.to_s.length > d.to_s.length
    solution += 1
  end
  i += 1
end

puts "found #{solution} in #{Time.now - t1}s"
# found 153 in 0.029938s
