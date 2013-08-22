=begin
Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way? 
=end

# paper and pencil ftw!
# f(n) = 4(2n+1)^2 – 12n + f(n-1)

def f(n)
  return 0 if n == 0
  (4 * (2 * n + 1)**2) - (12 * n) + f(n - 1)
end

t1 = Time.now
puts "found #{f(500) + 1} in #{Time.now - t1}s"

# found 669171001 in 0.0027s