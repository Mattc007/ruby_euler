# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify 
# it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

# There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing 
# two digits in the numerator and denominator.

# If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

t1 = Time.now
curious = []

(10..999).each do |numerator|
  (numerator..999).each do |denominator|
    n = numerator.to_s.split('').map(&:to_i)
    d = denominator.to_s.split('').map(&:to_i)
    n.each_with_index do |digit, index|
      break if digit == 0 && index == (n.length - 1)
      if d.include?(digit)
        d.delete(digit)
        d_r = d.map(&:to_s).join('').to_i 
        n.delete(digit)
        n_r = n.map(&:to_s).join('').to_i  
        if (d_r != 0 && n_r != 0) && (numerator.to_f / denominator) == (n_r.to_f / d_r) && numerator != denominator
          curious.push([numerator, denominator])
        end
      end
    end
  end
end

denominator_product = 1
curious.each do |fraction|
  q = fraction[0].to_f / fraction[1]
  denominator_product *= (1 / q)
end

puts "found #{denominator_product} in #{Time.now - t1}s"

# found 100.0 in 0.097877