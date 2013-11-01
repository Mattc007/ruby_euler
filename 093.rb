# By using each of the digits from the set, {1, 2, 3, 4}, exactly once, and 
# making use of the four arithmetic operations (+, −, *, /) and 
# brackets/parentheses, it is possible to form different positive integer targets.

# For example,

# 8 = (4 * (1 + 3)) / 2
# 14 = 4 * (3 + 1 / 2)
# 19 = 4 * (2 + 3) − 1
# 36 = 3 * 4 * (2 + 1)

# Note that concatenations of the digits, like 12 + 34, are not allowed.

# Using the set, {1, 2, 3, 4}, it is possible to obtain thirty-one different 
# target numbers of which 36 is the maximum, and each of the numbers 1 to 28 
# can be obtained before encountering the first non-expressible number.

# Find the set of four distinct digits, a < b < c < d, for which the longest 
# set of consecutive positive integers, 1 to n, can be obtained, giving your 
# answer as a string: abcd.

# parentheses sets:
# ((a @ b) @ c) @ d
# (a @ (b @ c)) @ d
# a @ (b @ (c @ d))
# a @ ((b @ c) @ d)
# (a @ b) @ (c @ d)

def add(a, b)
 return nil if a == nil || b == nil
 a + b
end

def subtract(a, b)
  return nil if a == nil || b == nil
  a - b
end

def multiply(a, b)
  return nil if a == nil || b == nil
  a * b
end

def divide(n, divisor)
  return nil if divisor == 0 || n == nil || divisor == nil
  n / divisor
end

def apply(operands, operators)
  solutions = []
  solutions << send(operators[2], (send(operators[1], (send(operators[0], operands[0], operands[1])), operands[2])), operands[3])
  solutions << send(operators[2], (send(operators[0], operands[0], send(operators[1], operands[1], operands[2]))), operands[3])
  solutions << send(operators[0], operands[0], (send(operators[1], operands[1], (send(operators[2], operands[2], operands[3])))))
  solutions << send(operators[0], operands[0], send(operators[2], send(operators[1], operands[1], operands[2]), operands[3]))
  solutions << send(operators[1], send(operators[0], operands[0], operands[1]), (send(operators[2], operands[2], operands[3])))
  p solutions if operators == [1, 2, 5, 8]
  solutions
end

def consecutive_integers_max(solutions)
  prev = 0
  solutions.each do |value|
    break unless value == prev + 1
    prev = value
  end
  prev
end

t1 = Time.now

digits = (0..9).to_a
digits_sets = digits.permutation(4).to_a

operations = [:add, :subtract, :multiply, :divide]
operations_sets = operations.repeated_permutation(3).to_a

max_solution = 0
max_operands = []

digits_sets.each do |operands|
  next unless operands[0] < operands[1] && operands[1] < operands[2] && operands[2] < operands[3]
  solutions_sets = operations_sets.map { |ops| apply(operands, ops) }.flatten.compact
  solutions = solutions_sets.uniq.sort.select { |s| s > 0 }
  
  s = consecutive_integers_max(solutions)
  
  if s > max_solution
    max_solution = s
    max_operands = operands
  end
end

puts "found #{max_operands.map(&:to_i).join('')} with max solution #{max_solution} in #{Time.now - t1}s"
