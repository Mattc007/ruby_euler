# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; 
# for example, the 5-digit number, 15234, is 1 through 5 pandigital.

# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and 
# product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

# 9 digits max = (1 digit * 4 digits) or (2 digits * 3 digits), so max 4 digits -> 9876

def pandigital?(n)
  digits = 0
  count = 0

  while n > 0
    q = digits
    digits = digits | 1 << ((n % 10) - 1)
    return false if q == digits
    count += 1
    n /= 10
  end
  
  digits == (1 << count) - 1 
end

def number_concat(*args)
  val = ''
  args.map(&:to_s).map { |s| val << s }
  val.to_i
end

t1 = Time.now
max = 10000
sum = 0
products = {}

(2..100).each do |multiplier|
  multiplicand_start = (multiplier > 9) ? 123 : 1234
  multiplicand_end = max / (multiplier + 1)

  (multiplicand_start..multiplicand_end).each do |multiplicand|
    product = multiplier * multiplicand
    if pandigital?(number_concat(multiplier, multiplicand, product))
      products[product] = 1
    end
  end
end

puts "found #{products.keys.inject(:+)} in #{Time.now - t1}s"

# found 45228 in 0.177784s

