# Given that 0 ≤ x1, y1, x2, y2 ≤ 50, how many right triangles can be formed?

require 'rubygems'

t1 = Time.now
size = 50
result = size * size * 3
(1..size).each do |x|
  (1..size).each do |y|
    fact = y.to_i.gcd(x.to_i)
    result += [y*fact/x, (size - x)*fact/y].min * 2
  end
end

puts "found #{result} in #{Time.now - t1}s"
# found 14234 in 0.002589s
