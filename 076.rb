# It is possible to write five as a sum in exactly six different ways:

# 4 + 1
# 3 + 2
# 3 + 1 + 1
# 2 + 2 + 1
# 2 + 1 + 1 + 1
# 1 + 1 + 1 + 1 + 1

# How many different ways can one hundred be written as a sum of at least two positive integers?

t1 = Time.now
target = 100
ways = []

(target + 1).times { ways.push(0) }
ways[0] = 1

(1..target-1).each do |x|
  (x..target).each do |y|
    ways[y] += ways[y - x] if ways[y - x] && ways[y]
  end
end 

puts "found #{ways[target]} in #{Time.now - t1}s"

# found 73682 in 0.001763s
