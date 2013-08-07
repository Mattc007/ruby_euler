=begin

2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2**1000? 

=end

def sum_of_digits(n)
  n.to_s.split("").to_a.map(&:to_i).reduce(:+)
end

def two_to_the_power(n)
  arr = [1]

  n.times do 
    carry = 0
    arr.each_with_index do |value, index|
      arr[index] = 2 * value + carry
      if value > 4 
        arr[index] -= 10
        carry = 1
        arr.push(0) unless arr[index+1] 
      else
        carry = 0
      end
    end
  end

  return arr.reduce(:+)
end

t1 = Time.now
puts "#{two_to_the_power(1000)} found in #{Time.now - t1}s"

# 1366 found in 0.284306s
