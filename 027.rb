# Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum 
# number of primes for consecutive values of n, starting with n = 0.

require 'prime'

t1 = Time.now

n_max = 0
a_max = 0
b_max = 0

(-1000..1000).each do |a|
  (-1000..1000).each do |b|
    n = 0
    while Prime.prime?(n**2 + a*n + b)
      if n > n_max
        n_max = n
        a_max = a
        b_max = b
      end
      n += 1
    end  
  end
end

puts "found #{a_max*b_max} in #{Time.now - t1}s"

# found -59231 in 28.319429s
# could be optimized