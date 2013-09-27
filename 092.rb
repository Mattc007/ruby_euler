# A number chain is created by continuously adding the square of the digits in a number to 
# form a new number until it has been seen before.

# For example,

# 44 → 32 → 13 → 10 → 1 → 1
# 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

# Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is 
# most amazing is that EVERY starting number will eventually arrive at 1 or 89.

# How many starting numbers below ten million will arrive at 89?

# < 10_000_000 -> 7 digits --> greatest sum of squares = 9^2 * 7 = 81 * 7 = 567

def square_sum_mapper(number)
  if number > 9
    ((number % 10) ** 2 ) + square_sum_mapper(number / 10)
  else
    number**2
  end  
end

t1 = Time.now
eighty_niners = [58, 145, 24, 2, 4, 16, 37].sort
max_square_sum = 567
count = 0

(1..9_999_999).each do |number|
  possible_eighty_niners = [] 
  possible_eighty_niners.push(number) if number <= 567
  sum = square_sum_mapper(number)
  found = false
  while sum != 1
    if eighty_niners.include?(sum)
      found = true
      break
    end
    possible_eighty_niners.push(sum)
    sum = square_sum_mapper(sum)
  end
  if found
    count += 1
    eighty_niners += possible_eighty_niners
  end
end

puts "found #{count} in #{Time.now - t1}s"

