# Let p(n) represent the number of different ways in which n 
# coins can be separated into piles. For example, five coins 
# can separated into piles in exactly seven different ways, 
# so p(5)=7.

# OOOOO
# OOOO   O
# OOO   OO
# OOO   O   O
# OO   OO   O
# OO   O   O   O
# O   O   O   O   O
# Find the least value of n for which p(n) is divisible by
# one million.

# http://en.wikipedia.org/wiki/Partition_(number_theory)

t1 = Time.now
target = 1_000_000
p = [1]
n = 1

loop do 
  i = 0
  pentagonal = 1
  p << 0

  while pentagonal <= n
    sign = (i % 4 > 1) ? -1 : 1
    p[n] += sign * p[n - pentagonal]
    p[n] %= target
    i += 1

    j = (i % 2 == 0) ? i / 2 + 1 : -1 * (i / 2 + 1)
    pentagonal = j * (3 * j - 1) / 2
  end

  break if p[n] == 0
  n += 1
end

puts "found #{n} in #{Time.now - t1}s"
