# A palindromic number reads the same both ways. The largest palindrome 
# made from the product of two 2-digit numbers is 9009 = 91 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

biggest_product = 0
biggest_x = 0
biggest_y = 0

(100...999).each do |x|
  (x...999).each do |y|
    if (x*y).to_s.reverse == (x*y).to_s && (x*y) > biggest_product
      biggest_product = (x*y) 
      biggest_x = x
      biggest_y = y
    end
  end
end

puts biggest_x.to_s << " * " << biggest_y.to_s << " = " << biggest_product.to_s