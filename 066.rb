# Consider quadratic Diophantine equations of the form:

# x**2 – Dy**2 = 1

# For example, when D=13, the minimal solution in x is 
# 649**2 – 13×180**2 = 1.

# It can be assumed that there are no solutions in positive 
# integers when D is square.

# By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we 
# obtain the following:

# 3**2 – 2×2**2 = 1
# 2**2 – 3×1**2 = 1
# 9**2 – 5×4**2 = 1
# 5**2 – 6×2**2 = 1
# 8**2 – 7×3**2 = 1

# Hence, by considering minimal solutions in x for D ≤ 7, the 
# largest x is obtained when D=5.

# Find the value of D ≤ 1000 in minimal solutions of x for which 
# the largest value of x is obtained.

# http://en.wikipedia.org/wiki/Pell%27s_equation
# http://en.wikipedia.org/wiki/Chakravala_method

require 'prime'

t1 = Time.now
result = 0
max_x = 0
limit = 1000
primes = Prime.first(limit)

def find_pell(d)
  p, k, x1, y = 1, 1, 1, 0
  while k != 1 || y == 0
    if k == -1
      p = -1 * p
    else
      p = k * (p / (k + 1)) - p
    end
    p = p - ((p - Math.sqrt(d)) / k).to_i * k

    x = (p * x1 + d * y) / k.abs
    y = (p * y + x1) / k.abs
    k = (p * p - d) / k

    x1 = x
  end
  x
end

primes.each do |d|
  break if d > limit
  solution = [find_pell(d), d].max
  if solution > result
    result = solution 
    max_x = d
  end
end

puts "found #{max_x} in #{Time.now - t1}s"
# found 661 in 0.020009s
