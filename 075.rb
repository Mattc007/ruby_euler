# It turns out that 12 cm is the smallest length of wire that can be bent to 
# form an integer sided right angle triangle in exactly one way, but there are 
# many more examples.

# 12 cm: (3,4,5)
# 24 cm: (6,8,10)
# 30 cm: (5,12,13)
# 36 cm: (9,12,15)
# 40 cm: (8,15,17)
# 48 cm: (12,16,20)

# In contrast, some lengths of wire, like 20 cm, cannot be bent to form an integer 
# sided right angle triangle, and other lengths allow more than one solution to be 
# found; for example, using 120 cm it is possible to form exactly three different 
# integer sided right angle triangles.

# 120 cm: (30,40,50), (20,48,52), (24,45,51)

# Given that L is the length of the wire, for how many values of L ≤ 1,500,000 
# can exactly one integer sided right angle triangle be formed?

# http://en.wikipedia.org/wiki/Pythagorean_triple

def gcd(a, b)
  x, y = 0, 0

  if a > b
    x = a
    y = b
  else
    x = b
    y = a
  end

  while x % y != 0
    t = x
    x = y
    y = t % x
  end

  y
end

t1 = Time.now
limit = 1_500_000
triangles = []
result = 0;
m_limit = Math.sqrt(limit / 2).to_i

(2..m_limit).each do |m|
  (1..m).each do |n|
    if ( (n + m) % 2 == 1 ) && ( gcd(n, m) == 1 )
      a = m**2 + n**2
      b = m**2 - n**2
      c = 2 * m * n
      p = a + b + c

      while p <= limit
        if triangles[p]
          triangles[p] += 1
        else
          triangles[p] = 1
        end

        result += 1 if triangles[p] == 1
        result -= 1 if triangles[p] == 2
        p += a + b + c
      end
    end
  end
end


puts "found #{result} in #{Time.now - t1}s"
