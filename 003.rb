# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

#require 'prime'
#p 600851475143.prime_division

n = 600851475143
p = 2
while n > 1 do
  while n%p > 0 do
    p = p+1
  end
  n = n/p
end

puts p