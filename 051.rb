# By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible 
# values: 13, 23, 43, 53, 73, and 83, are all prime.

# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first 
# example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 
# 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest 
# prime with this property.

# Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with 
# the same digit, is part of an eight prime value family.

# must have three repeating digits

require 'prime'

t1 = Time.now
start = 57000

Prime.each do |p|
  next if p < start
  break if p - 999_999 > 0 #9_999_999_999 > 0 # more than 10 digits
  prime_count = 1
  digits = Array.new(10, 0)
  p.to_s.split('').each { |d| digits[d.to_i] += 1}
  if digit = digits.index(3)  # we have a candidate
    perms = []
    (0..9).each do |d|
      break if d - prime_count > 3
      next if d == digit 
      perm = p.to_s.gsub(digit.to_s, d.to_s).to_i
      next if perm < start
      if Prime.prime?(perm)
        prime_count += 1 
        perms.push(perm)
      end
    end
  end
  if prime_count >= 8
    puts "found #{p} in #{Time.now - t1}s"  
    break
  end
end

# found 121313 in 0.350033s
