# A Pythagorean triplet is a set of three natural numbers, a  b  c, for 
# which,

# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def is_triplet(a, b, c)
  return (c**2 == a**2 + b**2) && a < b && b < c
end

def is_sum(a, b, c)
  return (a + b + c) == 1000
end

# brute force
t1 = Time.now
found = false
a = 1
b = 1
c = 1
max = 1000

(1..max).each do |x| 
  break if found
  (1..max).each do |y|
    break if found
    (1..max).each do |z|
      break if found
      a, b, c = x, y, z
      # puts "#{a}^2 + #{b}^2 ?= #{c}^2 <===> #{a+b+c}"
      found = is_triplet(a,b,c) && is_sum(a,b,c)
    end
  end
end

delta = Time.now - t1

puts "found #{a}^2 + #{b}^2 = #{c}^2 in #{delta}s" if found
puts "not found (took #{delta}s" unless found

# mathemagical
# a = 2mn, b = m**2 - n**2, c = m**2 + n**2

def find_triplet(sum)
  m = 0
  (0..sum).each do |n|
    d = n**2 + 2*sum
    m1 = (-n + Math.sqrt(d)) / 2
    m2 = (-n - Math.sqrt(d)) / 2
    if m1.integer? && m1 > n
      m = m1
    elsif m2.integer? && m2 > n
      m = m2
    end
    if m != 0
      return [2*m*n, m**2 - n**2, m**2 + n**2]
    end      
  end
end

t1 = Time.now
puts find_triplet(1000)
puts "took #{Time.now - t1}s"