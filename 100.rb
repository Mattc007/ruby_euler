# If a box contains twenty-one coloured discs, composed of fifteen blue discs and 
# six red discs, and two discs were taken at random, it can be seen that the 
# probability of taking two blue discs, P(BB) = (15/21)×(14/20) = 1/2.

# The next such arrangement, for which there is exactly 50% chance of taking two 
# blue discs at random, is a box containing eighty-five blue discs and thirty-five 
# red discs.

# By finding the first arrangement to contain over 10**12 = 1,000,000,000,000 discs 
# in total, determine the number of blue discs that the box would contain.

# use http://www.alpertron.com.ar/QUAD.HTM to calc the diophantine solutions
# (blue / total)*( (blue - 1) / (total - 1) ) = 0.5

# blue_n+1 = 3*(blue_n) + 2*(total_n) - 2
# total_n+1 = 4*(blue_n) + 3*(total_n) - 3

t1 = Time.now
minimum_discs = 10**12
blue, total = 15, 21


while total < minimum_discs
  b = 3*blue + 2*total - 2
  t = 4*blue + 3*total - 3

  blue, total = b, t
end

puts "found #{blue} in #{Time.now - t1}s"
