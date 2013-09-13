# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

t1 = Time.now

result = 0

1.upto(1000).each { |n| result += n**n }

result = result.to_s[-10..-1].to_i

puts "found #{result} in #{Time.now - t1}s"
# found 9110846700 in 0.01685s


