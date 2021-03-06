# Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. The first ten pentagonal numbers are:

# 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

# It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference, 70 − 22 = 48, is 
# not pentagonal.

# Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference are pentagonal 
# and D = |Pk − Pj| is minimised; what is the value of D?

def get_pentagonal(n)
  n*(3*n - 1) / 2
end

def is_pentagonal(p)
  n = ((24 * p + 1)**0.5 + 1) / 6
  n == n.to_i
end

t1 = Time.now
d = 0
not_found = true
i = 1
pentagonals = [1, 5]

while not_found
  i += 1
  k = get_pentagonal(i)
  pentagonals[i] = k
  (i - 1).downto(1).each do |n|
    j = pentagonals[n]
    if is_pentagonal(k - j) && is_pentagonal(j + k)
      d = k - j
      not_found = false
    end
  end
end

puts "found #{d} in #{Time.now - t1}s"
# found 5482660 in 0.823111s

