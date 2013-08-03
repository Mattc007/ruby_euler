# 2520 is the smallest number that can be divided by each of the numbers 
# from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all 
# of the numbers from 1 to 20?

primes = [2, 3, 5, 7, 11, 13, 17, 19]
n = 20
number = 1

primes.each do |x|
  m = 1
  while x**m <= n
    m = m+1
  end
  number = number * x**(m-1)
end

p number