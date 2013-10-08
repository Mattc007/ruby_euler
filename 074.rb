# The number 145 is well known for the property that the sum of the factorial of 
# its digits is equal to 145:

# 1! + 4! + 5! = 1 + 24 + 120 = 145

# Perhaps less well known is 169, in that it produces the longest chain of numbers that 
# link back to 169; it turns out that there are only three such loops that exist:

# 169 → 363601 → 1454 → 169
# 871 → 45361 → 871
# 872 → 45362 → 872

# It is not difficult to prove that EVERY starting number will eventually get stuck in a loop. 
# For example,

# 69 → 363600 → 1454 → 169 → 363601 (→ 1454)
# 78 → 45360 → 871 → 45361 (→ 871)
# 540 → 145 (→ 145)

# Starting with 69 produces a chain of five non-repeating terms, but the longest non-repeating 
# chain with a starting number below one million is sixty terms.

# How many chains, with a starting number below one million, contain exactly sixty non-repeating 
# terms?

def sum_factorials(number, factorials)
  sum = 0
  number.to_s.chars.each do |digit|
    sum += factorials[digit.to_i]
  end
  sum
end

t1 = Time.now
upper_limit = 1_000_000
target = 60
target_chains = 0
chains = [1]

factorials = [1]
(1..9).each do |digit|
  factorials.push (1..digit).inject(:*)
end

(1..upper_limit).each do |i|
  n = i
  count = 0
  sequence = []

  while !sequence.include? n
    sequence.push(n)
    n = sum_factorials(n, factorials)
    count += 1

    if n <= upper_limit && chains[n] && chains[n] > 0
      count += chains[n]
      break
    end
  end

  target_chains += 1 if count == target

  sequence.each do |element|
    chains[element] = count if element && element <= upper_limit
    count -= 1
  end
end

puts "found #{target_chains} in #{Time.now - t1}s"
# found 402 in 6.915608s
