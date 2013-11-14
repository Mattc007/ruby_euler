# The radical of n, rad(n), is the product of distinct prime factors of 
# n. For example, 504 = 2^3 × 3^2 × 7, so rad(504) = 2 × 3 × 7 = 42.

# If we calculate rad(n) for 1 ≤ n ≤ 10, then sort them on rad(n), and 
# sorting on n if the radical values are equal, we get:

# Let E(k) be the kth element in the sorted n column; for example, 
# E(4) = 8 and E(6) = 9.

# If rad(n) is sorted for 1 ≤ n ≤ 100000, find E(10000).

class Radical
  include Comparable

  attr_accessor :rad, :number

  def initialize(rad, number)
    @rad = rad
    @number = number
  end

  def <=>(other)
    return 1 if rad > other.rad
    return -1 if rad < other.rad
    return number > other.number ? 1 : -1
  end

  def inspect
    puts "#{number} : #{rad}"
  end
end

t1 = Time.now
limit = 100_000
radicals = []

0.upto(limit).each do |i|
  radicals[i] = Radical.new(1, i)
end

2.upto(limit).each do |i|
  if radicals[i].rad == 1
    radicals[i].rad = i 

    (i+i...limit).step(i) do |j|
      radicals[j].rad *= i
    end
  end
end

radicals.sort!

puts "found #{radicals[9999].number} in #{Time.now - t1}s"
# found 21417 in 0.384311s
