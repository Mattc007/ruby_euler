=begin

The following iterative sequence is defined for the set of positive integers:

n  n/2 (n is even)
n  3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13  40  20  10  5  16  8  4  2  1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. 
Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers 
finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.  

=end

class Collatz
  @max_start = 10
  @iterative_map = {} # "num" => (terms until 1)

  attr_reader :iterative_map

  def initialize(max_start)
    @max_start = max_start if (max_start > 0)
    @iterative_map = {}
  end

  def iter_even(n)
    q = n/2
    return q
  end

  def iter_odd(n)
    q = 3*n + 1
    return q
  end

  def get_chain(n=@max_start)
    if iterative_map.key?(n)
      return iterative_map[n] 
    end
    
    if n==1 
      return 0
    end

    if n.even?
      return iterative_map[n] = get_chain(iter_even(n)) + 1
    else
      return iterative_map[n] = get_chain(iter_odd(n)) + 1
    end
  end

  def find_max
    max_terms = 0
    max_value_start = 0

    (1..@max_start).each do |x|
      val = get_chain(x)
      if val > max_terms
        max_terms = val
        max_value_start = x
      end
    end

    return max_value_start, max_terms

  end

end

t1 = Time.now
c = Collatz.new(1000000)
p c.find_max
puts "took #{Time.now - t1}s"

# [837799, 524]
# took 3.300969s

