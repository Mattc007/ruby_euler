# What is most surprising is that the important mathematical constant,
# e = [2; 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...].

# The first ten terms in the sequence of convergents for e are:

# 2, 3, 8/3, 11/4, 19/7, 87/32, 106/39, 193/71, 1264/465, 1457/536, ...

# The sum of digits in the numerator of the 10th convergent is 1+4+5+7=17.
# Find the sum of digits in the numerator of the 100th convergent of the continued fraction for e.

# numerator pattern -> n_k = a_k * n_{k-1} + n_{k-2}

t1 = Time.now
upper_bound = 100
d = 1
n = 2

(2..upper_bound).each do |counter|
  d_prime = d
  c = (counter % 3 == 0) ? 2 * (counter / 3) : 1
  d = n
  n = c * d + d_prime
end

result = n.to_s.chars.map(&:to_i).reduce(:+)

puts "found #{result} in #{Time.now - t1}s"
# found 272 in 0.00033s
