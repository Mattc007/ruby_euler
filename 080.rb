# It is well known that if the square root of a natural number is not an integer,
# then it is irrational. The decimal expansion of such square roots is infinite
# without any repeating pattern at all.

# The square root of two is 1.41421356237309504880..., and the digital sum of 
# the first one hundred decimal digits is 475.

# For the first one hundred natural numbers, find the total of the digital sums 
# of the first one hundred decimal digits for all the irrational square roots.

# http://www.afjarvis.staff.shef.ac.uk/maths/jarvisspec02.pdf

def square_root(n, precision)
  limit = 10**(precision+1)
  a = 5 * n
  b = 5

  while (b < limit)
    if a >= b
      a -= b
      b += 10 
    else
      a *= 100
      b = (b / 10) * 100 + 5
    end
  end

  b / 100
end

def digit_sum(n)
  n.to_s.chars.map(&:to_i).reduce(:+)
end

t1 = Time.now
result = 0
j = 1

(1..100).each do |i|
  if j**2 == i
    j += 1
    next
  end
  result += digit_sum(square_root(i, 100))
end

puts "found #{result} in #{Time.now - t1}s"
# found 40886 in 0.047739s
