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
# ((0 @0 1) @1 2) @2 3 | ((1 - 2) * 5) + 8 => 2.5  | @3(@2(@1(a,b),c),d)
# (0 @0 (1 @1 2)) @2 3 | (1 - (2 * 5)) + 8 => 2.5  | @3(@1(a,@2(b,c)),d)
# 0 @0 (1 @1 (2 @2 3)) | 1 - (2 * (5 + 8)) => -0.2 | @1(a,@2(b,@3(c,d)))
# 0 @0 ((1 @1 2) @2 3) | 1 - ((2 * 5) + 8) => -3.5 | @1(a,@3(@2(b,c),d))
# (0 @0 1) @1 (2 @2 3) | (1 - 2) * (5 + 8) => -0.2 | @2(@1(a,b),@3(c,d))

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
  solutions << send(operators[2], send(operators[1], send(operators[0], operands[0], operands[1]), operands[2]), operands[3])
  solutions << send(operators[1], send(operators[0], operands[0], operands[1]), (send(operators[2], operands[2], operands[3])))
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

digits = (0..9).map(&:to_f).to_a
digits_sets = digits.combination(4).to_a

operations = [:add, :subtract, :multiply, :divide]
operations_sets = operations.repeated_permutation(3).to_a

max_solution = 0
max_operands = []

digits_sets.each do |operands_group|
  solutions_sets = []
  operands_group.permutation(4).to_a.each do |operands|
    solutions_sets << operations_sets.map { |ops| apply(operands, ops) }.flatten.compact
  end
  
  solutions_sets.flatten!.compact!
  
  solutions = solutions_sets.uniq.sort.select { |s| s.floor == s && s > 0}.map(&:to_i).uniq
  s = consecutive_integers_max(solutions)
    
  if s > max_solution
    max_solution = s
    max_operands = operands_group
  end
end

puts "found #{max_operands.map(&:to_i).join('')} with max solution #{max_solution} in #{Time.now - t1}s"
# found 1258 with max solution 51 in 1.201953s
