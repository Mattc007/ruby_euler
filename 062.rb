# The cube, 41063625 (3453), can be permuted to produce two other cubes: 56623104 (3843) 
# and 66430125 (4053). In fact, 41063625 is the smallest cube which has exactly three 
# permutations of its digits which are also cube.

# Find the smallest cube for which exactly five permutations of its digits are cube.

class Cube
  attr_accessor :value
  attr_accessor :permutations

  def initialize(v, p)
    @value = v
    @permutations = p
  end
end

t1 = Time.now
n = 345

cubes = {}
solution = 0

while true
  n += 1
  cube = n**3
  cube_key = cube.to_s.chars.sort.reverse.join.to_i

  cubes.merge!({ cube_key => Cube.new(n, 0) }) unless cubes.has_key? cube_key
  
  cubes[cube_key].permutations += 1
  
  if cubes[cube_key].permutations == 5
    solution = cubes[cube_key]
    break
  end
end

puts "found #{solution.value**3} in #{Time.now - t1}s"
# found 127035954683 in 0.136344s
