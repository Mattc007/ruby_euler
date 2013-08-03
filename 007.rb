# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see 
# that the 6th prime is 13.
# What is the 10 001st prime number?

n = 1000001

# sieve of eratosthenes
t1 = Time.now
arr = [2,3]
counter = 4

while arr.count < n
  if (counter%2 != 0 && counter%3 != 0)
    tmp = 4
    while tmp**2 <= counter
      if counter % tmp == 0
        break
      end
      tmp+=1
    end
    if tmp**2 > counter
      arr.push(counter)
    end
  end
  counter+=1
end
delta = Time.now - t1
puts "sieve: #{arr.last} in #{delta}s"

# library
t1 = Time.now
require 'prime'
a = Prime.first(n).last
delta = Time.now - t1
puts "prime lib: #{a} in #{delta}s"