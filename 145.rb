# Some positive integers n have the property that the sum 
# [ n + reverse(n) ] consists entirely of odd (decimal) digits. 
# For instance, 36 + 63 = 99 and 409 + 904 = 1313. We will call 
# such numbers reversible; so 36, 63, 409, and 904 are reversible. 
# Leading zeroes are not allowed in either n or reverse(n).

# There are 120 reversible numbers below one-thousand.

# How many reversible numbers are there below one-billion (10**9)?

t1 = Time.now
max = 10**6
found = 0

(1..max).each do |n|
  next if n.to_s.chars.last == '0'
  t = n + n.to_s.reverse.to_i
  found += 1 if t.to_s.chars.map(&:to_i).select(&:odd?).length == t.to_s.length
end

puts "found #{found} in #{Time.now - t1}s"
