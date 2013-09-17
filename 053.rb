# There are exactly ten ways of selecting three from five, 12345:

# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

# In combinatorics, we use the notation, 5C3 = 10.

# In general,

# nCr = 
# n!
# r!(n−r)!
# ,where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
# It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.

# How many, not necessarily distinct, values of  nCr, for 1 ≤ n ≤ 100, are greater than one-million?

t1 = Time.now
factorials = {}
solutions = 0

n = 1
while n <= 100
  r = 1
  while r < n
    if n_fact = factorials[n]
    else
      n_fact = (1..n).inject(:*)
      factorials[n] = n_fact
    end

    if r_fact = factorials[r]
    else 
      r_fact = (1..r).inject(:*)
      factorials[r] = r_fact
    end

    if n_r_fact = factorials[n-r]
    else 
      n_r_fact = (1..(n-r)).inject(:*)
      factorials[n-r] = n_r_fact
    end

    comb = n_fact / (r_fact * n_r_fact)
    solutions += 1 if comb > 1_000_000
    r += 1
  end
  n += 1
end

puts "found #{solutions} in #{Time.now - t1}s"
# found 4075 in 0.02548s
