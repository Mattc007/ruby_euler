# The radical of n, rad(n), is the product of distinct prime factors of 
# n. For example, 504 = 2^3 × 3^2 × 7, so rad(504) = 2 × 3 × 7 = 42.

# If we calculate rad(n) for 1 ≤ n ≤ 10, then sort them on rad(n), and 
# sorting on n if the radical values are equal, we get:

# Let E(k) be the kth element in the sorted n column; for example, 
# E(4) = 8 and E(6) = 9.

# If rad(n) is sorted for 1 ≤ n ≤ 100000, find E(10000).

class Rad

  def initialize
    @prime_factors = { 2 => [2] }
  end

  def solve
    t1 = Time.now
    e = {}
    n = 100_000
    1.upto(n).each do |i|
      e[i] = rad(i)
    end

    solution = e.sort_by(&:reverse)[9999][0]
    puts "found #{solution} in #{Time.now - t1}s"
  end

  private
    def get_prime_factors(n)
      return [] if n == 1
      return @prime_factors[n.to_s] if @prime_factors.has_key?(n.to_s)
      factor = (2..n).find {|x| n % x == 0} 
      [factor] + get_prime_factors(n / factor) 
    end

    def rad(n)
      return 1 if n == 1
      factors = get_prime_factors n
      @prime_factors[n] = factors
      factors.uniq.reduce(:*)
    end
end

r = Rad.new
r.solve
