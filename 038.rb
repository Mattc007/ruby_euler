# Take the number 192 and multiply it by each of 1, 2, and 3:

# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will 
# call 192384576 the concatenated product of 192 and (1,2,3)

# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving 
# the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the 
# concatenated product of an integer with (1,2, ... , n) where n > 1?

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

largest = 918273645
max_length = 9  # 1 - 9
my_integer = 9
n_max = 5

while my_integer / (10**(max_length / 2)) < 1
  my_integer += 1
  if my_integer.to_s.split('').first != '9'
    power = my_integer / 10
    my_integer = 9 * 10 * power
  end
  product = 0
  concatenated_product = ''
  (1..n_max).each do |n|
    product = my_integer * n
    concatenated_product << product.to_s
    if concatenated_product.to_i > largest 
      break if concatenated_product.length > max_length
      largest = concatenated_product.to_i if pandigital?(concatenated_product.to_i)
    end
  end
end

puts "found #{largest} in #{Time.now - t1}s"
# found 932718654 in 0.01179s
