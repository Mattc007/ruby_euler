# A googol (10100) is a massive number: one followed by one-hundred zeros; 100100 is almost unimaginably 
# large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

# Considering natural numbers of the form, ab, where a, b < 100, what is the maximum digital sum?

t1 = Time.now
maximum = 0

(2..100).each do |a|
  (2..100).each do |b|
    product = a**b
    sum_of_digits = product.to_s.chars.map! { |d| d.to_i }.reduce(:+)
    if sum_of_digits > maximum
      maximum = sum_of_digits
    end
  end
end

puts "found #{maximum} in #{Time.now - t1}s"
# found 972 in 0.334715s
