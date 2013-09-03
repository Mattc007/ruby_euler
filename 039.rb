# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, 
# there are exactly three solutions for p = 120.

# {20,48,52}, {24,45,51}, {30,40,50}

# For which value of p ≤ 1000, is the number of solutions maximised?

# a < b < c

solutions = {}
solutions.default = 0
p_max = 1000

(1..(p_max / 2)).each do |a|
  (a..(p_max / 2)).each do |b|
    break if a + b > (p_max / 2)
    c = Math.sqrt(a**2 + b**2)
    next unless c.denominator == 1
    solutions[a + b + c] += 1
  end
end

sorted = solutions.sort { |p, s| p[1] <=> s[1] }

puts "found #{sorted.last}"


