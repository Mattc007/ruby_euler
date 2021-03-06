# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:

# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?

t1 = Time.now
coins = [1, 2, 5, 10, 20, 50, 100, 200]
target = 200
ways = []

(target + 1).times { ways.push(0) }
ways[0] = 1

coins.each do |x|
  (x..target).each do |y|
    ways[y] += ways[y - x] if ways[y - x] && ways[y]
  end
end 

puts "found #{ways[target]} in #{Time.now - t1}s"

# found 73682 in 0.001763s


