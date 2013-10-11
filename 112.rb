# Working from left-to-right if no digit is exceeded by the digit to its left 
# it is called an increasing number; for example, 134468.

# Similarly if no digit is exceeded by the digit to its right it is called a 
# decreasing number; for example, 66420.

# We shall call a positive integer that is neither increasing nor decreasing a 
# "bouncy" number; for example, 155349.

# Clearly there cannot be any bouncy numbers below one-hundred, but just over 
# half of the numbers below one-thousand (525) are bouncy. In fact, the least 
# number for which the proportion of bouncy numbers first reaches 50% is 538.

# Surprisingly, bouncy numbers become more and more common and by the time we 
# reach 21780 the proportion of bouncy numbers is equal to 90%.

# Find the least number for which the proportion of bouncy numbers is exactly 99%.

def is_bouncy?(number)
  increasing, decreasing = false, false
  previous_digit = number % 10
  number /= 10

  while number > 0
    next_digit = number % 10
    number /= 10
    increasing = true if next_digit < previous_digit
    decreasing = true if next_digit > previous_digit

    previous_digit = next_digit

    return true if decreasing && increasing
  end

  decreasing && increasing
end

t1 = Time.now
count = 99
bouncy_numbers = 0

while 100*bouncy_numbers < 99*count
  count += 1
  bouncy_numbers += 1 if is_bouncy? count
end

puts "found #{count} in #{Time.now - t1}s"
