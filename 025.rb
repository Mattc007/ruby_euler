# What is the first term in the Fibonacci sequence to contain 1000 digits?"

fibonacci = [1,1]
x = 1

while fibonacci.max.to_s.length < 1000
  fibonacci.push(fibonacci[x-2] + fibonacci[x-3]) if x > fibonacci.length
  x += 1
end

t1 = Time.now
puts "found #{fibonacci.length} in #{Time.now - t1}s"

# found 4782 in 5.0e-06s