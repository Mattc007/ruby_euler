# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal 
# fraction part.

t1 = Time.now
sequence_length = 0
1000.downto(1).each do |x|
  break if sequence_length >= x

  remainders = []
  value = 1
  position = 0

  while (!remainders[value] || remainders[value] == 0) && value != 0
    remainders[value] = position
    value *= 10
    value %= x
    position += 1
  end

  if remainders[value]
    sequence_length = position - remainders[value] if position - remainders[value] > sequence_length
  end

  sequence_length += 1 

end

puts "found #{sequence_length} in #{Time.now - t1}s"

# found 983 in 0.003387s