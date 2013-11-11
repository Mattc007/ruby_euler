# Three distinct points are plotted at random on a Cartesian plane, 
# for which -1000 ≤ x, y ≤ 1000, such that a triangle is formed.

# Consider the following two triangles:

# A(-340,495), B(-153,-910), C(835,-947)

# X(-175,41), Y(-421,-714), Z(574,-645)

# It can be verified that triangle ABC contains the origin, whereas 
# triangle XYZ does not.

# Using triangles.txt (right click and 'Save Link/Target As...'), a 
# 27K text file containing the co-ordinates of one thousand "random" 
# triangles, find the number of triangles for which the interior 
# contains the origin.

# NOTE: The first two examples in the file represent the triangles in 
# the example given above.

# http://www.blackpawn.com/texts/pointinpoly/default.html

require 'matrix'

t1 = Time.now

def check_point(a, b, c)
  p = Vector[0,0]

  v0 = c - a
  v1 = b - a
  v2 = p - a

  dot00 = v0.inner_product v0
  dot01 = v0.inner_product v1
  dot02 = v0.inner_product v2
  dot11 = v1.inner_product v1
  dot12 = v1.inner_product v2

  inverse_dom = 1.0 / (dot00 * dot11 - dot01 * dot01)
  u = (dot11 * dot02 - dot01 * dot12) * inverse_dom
  v = (dot00 * dot12 - dot01 * dot02) * inverse_dom

  u >= 0 && v >= 0 && u + v < 1
end

triangles = []
solution = 0

file = File.new("triangles.txt", "r")
while (line = file.gets)
    triangles << line.tr("\n","").split(',').map!(&:to_i)
end
file.close

triangles.each do |points_list|
  solution += 1 if check_point Vector[points_list[0], points_list[1]], \
                               Vector[points_list[2], points_list[3]], \
                               Vector[points_list[4], points_list[5]]
end

puts "found #{solution} in #{Time.now - t1}s"
# found 228 in 0.023234s
