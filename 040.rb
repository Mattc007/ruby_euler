# An irrational decimal fraction is created by concatenating the positive integers:

# 0.123456789101112131415161718192021...

# It can be seen that the 12th digit of the fractional part is 1.

# If dn represents the nth digit of the fractional part, find the value of the following expression.

# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
t1 = Time.now

max_power = 7 # 10**0 ... 10**6 ==> 7
product = 1
count = 0
digits = 0

max_power.times do |i|
  target = 10**i

  while count < target
    digits += 1
    count += Math.log10(digits).to_i + 1
  end

  product *= digits.to_s.reverse[count - target].to_i
end

puts "found #{product} in #{Time.now - t1}s"
# found 210 in 0.064513s