=begin

A permutation is an ordered arrangement of objects. For example, 3124 is one possible 
permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically 
or alphabetically, we call it lexicographic order. The lexicographic permutations 
of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

=end

def solve(n, index)
  remaining = index - 1
  p = []
  numbers = (0..n).to_a

  (1..n).each do |x|
    q = (n-(x-1)).downto(1).inject(:*)
    removal_index = remaining / q
    remaining = remaining % q
    p.push(numbers[removal_index])
    numbers.delete_at(removal_index)
    break if remaining == 0
  end

  (0..numbers.length-1).each do |y|
    p.push(numbers[y])
  end

  p.flatten.to_s.to_i 

end

t1 = Time.now
puts "found #{solve(9,1_000_000)} in #{Time.now - t1}s"

# found 2783915460 in 0.000134s
