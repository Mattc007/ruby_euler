# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, 
# is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit 
# numbers are permutations of one another.

# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this 
# property, but there is one other 4-digit increasing sequence.

# What 12-digit number do you form by concatenating the three terms in this sequence?

require 'mathn'

t1 = Time.now
result = 0

Prime.each do |m|
  next if m < 1000 || m == 1487

  n, q = m + 3330, m + 6660
  break if q > 9999
  next if !n.prime? || !q.prime?

  permutations = m.to_s.chars.to_a.permutation(4).map { |perm| perm.join.to_i }
  next if !permutations.include?(n) || !permutations.include?(q)

  result = m.to_s + n.to_s + q.to_s
  break
end

puts "found #{result} in #{Time.now - t1}s"
