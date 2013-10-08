# NOTE: This problem is a more challenging version of Problem 81.

# The minimal path sum in the 5 by 5 matrix below, by starting in 
# any cell in the left column and finishing in any cell in the right 
# column, and only moving up, down, and right, is indicated in red and 
# bold; the sum is equal to 994.


# 131 673 234 103 18
# 201 96  342 965 150
# 630 803 746 422 111
# 537 699 497 121 956
# 805 732 524 37  331

# Find the minimal path sum, in matrix.txt (right click and 
# 'Save Link/Target As...'), a 31K text file containing a 80 by 80 matrix,
# from the left column to the right column.

t1 = Time.now
matrix = ""
dimension = 80
solution = []

file = File.new("matrix.txt", "r")
while (line = file.gets)
    matrix << line
    matrix << ","
end
file.close

matrix = matrix.split(',').map(&:to_i).each_slice(dimension).to_a

(0..dimension-1).each do |i|
  solution[i] = matrix[i][dimension - 1]
end

(dimension-2).downto(0).each do |i|
  # go down
  solution[0] += matrix[0][i]
  (1..dimension-1).each do |j| 
    solution[j] = [solution[j - 1] + matrix[j][i], solution[j] + matrix[j][i]].min
  end

  # go up
  (dimension-2).downto(0).each do |j|
    solution[j] = [solution[j], solution[j + 1] + matrix[j][i]].min
  end
end

puts "found #{solution.min} in #{Time.now - t1}s"
