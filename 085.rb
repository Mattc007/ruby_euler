# By counting carefully it can be seen that a rectangular grid measuring 3 by 2 
# contains eighteen rectangles:

# Although there exists no rectangular grid that contains exactly two million 
# rectangles, find the area of the grid with the nearest solution.

# 1x1 - 1
# 2x1 - 3
# 2x2 - 9
# 3x1 - 6
# 3x2 - 18
# 3x3 - 30 

t1 = Time.now
upper_limit = 2_000_000
area = 0
error = upper_limit
x = 2000
y = 1

while x >= y
  rectangles = x * (x + 1) * y * (y + 1) / 4
  if error > (rectangles - upper_limit).abs
    area = x * y
    error = (rectangles - upper_limit).abs
  end
  if rectangles > upper_limit
    x -= 1
  else
    y += 1
  end
end

puts "found #{area} in #{Time.now - t1}s"
# found 2772 in 0.004047s
