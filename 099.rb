# Comparing two numbers written in index form like 211 and 37 is not difficult, 
# as any calculator would confirm that 211 = 2048 < 37 = 2187.

# However, confirming that 632382518061 > 519432525806 would be much more difficult, 
# as both numbers contain over three million digits.

# Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file 
# containing one thousand lines with a base/exponent pair on each line, determine 
# which line number has the greatest numerical value.

# NOTE: The first two lines in the file represent the numbers in the example given above.

# log_a(x^y) = y * log_a(x)

t1 = Time.now
exponents = []
highest_value = 0
highest_line_number = 0

file = File.new("base_exp.txt", "r")
while (line = file.gets)
  exponents.push(line.tr("\n","").split(",").map(&:to_i))
end
file.close

exponents.each_with_index do |item, index|
  value = item.last * Math.log10(item.first)
  if value > highest_value
    highest_value = value
    highest_line_number = index + 1
  end
end

puts "found #{highest_line_number} in #{Time.now - t1}s"
# found 709 in 0.006261s
