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

t1 = Time.now
result = 0
p_max = 0

(10..1000).each do |d|
  limit = Math.sqrt(d).to_i
  next if limit**2 == d

  m = 0
  d = 1
  a = limit

  numerator_1 = 1
  numerator = a

  denominator_1 = 0
  denominator = 1

  puts "#{numerator} / #{denominator}"

  while ((numerator**2 - d*denominator**2) != 1)
    m = d * a - m
    d = (d - m**2) / d
    a = (limit + m) / d

    numerator_2 = numerator_1
    numerator_1 = numerator

    denominator_2 = denominator_1
    denominator_1 = denominator

    numerator = a * numerator_1 + numerator_2
    denominator = a * denominator_1 + denominator_2

    puts "#{numerator} / #{denominator}"

  end

  if numerator > p_max
    p_max = numerator
    result = d
    puts "new result = #{result}"
  end
end

puts "found #{result} in #{Time.now - t1}s"
