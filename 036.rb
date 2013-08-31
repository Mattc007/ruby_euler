# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

# (Please note that the palindromic number, in either base, may not include leading zeros.)

def generate_palindromes(ceiling)
  palindromes = []
  i = 1
  continue = true
  
  if ceiling < 10
    (1..ceiling).each { |x| palindromes.push(x) }
    return palindromes
  else
    (1..9).each { |x| palindromes.push(x) }
  end 

  while continue
    continue = false

    if ("#{i}#{i.to_s.reverse}").to_i < ceiling
      palindromes.push(("#{i}#{i.to_s.reverse}").to_i)
      continue = true
    else
      continue = false
    end

    (0..9).each do |d|
      s = i.to_s << d.to_s << i.to_s.reverse
      if s.to_i < ceiling
        palindromes.push(s.to_i)
      end
    end
    i += 1
  end

  palindromes

end

t1 = Time.now 

ceiling = 1_000_000
sum = 0
palindromes = generate_palindromes(ceiling)

palindromes.each do |x|
  b = x.to_s(2)
  if b == b.reverse
    sum += x
  end
end

puts "found #{sum} in #{Time.now - t1}s"

# found 872187 in 0.026041s