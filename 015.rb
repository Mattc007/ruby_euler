=begin

Starting in the top left corner of a 2x2 grid, and only being able to move to the right and down, 
there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20x20 grid?

=end

# (3,3) (3,2) (3,1) (3,0)
# (2,3) (2,2) (2,1) (2,0)
# (1,3) (1,2) (1,1) (1,0)
# (0,3) (0,2) (0,1) (0,0)

# (2N N) ==> 2N choose N  ::: n!/(k!(n-k)!) ==> (2N)!/((N!)^2)

t1 = Time.now

grid_size = 20
routes = 1

(0..grid_size-1).each do |x|
  routes *= (2 * grid_size) - x
  routes /= x + 1
end

puts "#{routes} found in #{Time.now - t1}s"

# 137846528820 found in 5.2e-05s