# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

n = 2000000

# sieve of eratosthenes
def prime_sum(max)
  arr = [2,3]
  counter = 4

  while arr.last < max
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

  return arr.reduce(:+) - arr.last

end

t1 = Time.now
puts "using sieve method: #{prime_sum(n)} found in #{Time.now-t1}s"

# prime lib
t1 = Time.now
require 'prime'

def prime_sum(max)
  return Prime.instance.inject(0) do |sum, n| 
    break sum unless n < max 
    sum + n 
  end
end

puts "using built-in class: #{prime_sum(n)} found in #{Time.now-t1}s"
