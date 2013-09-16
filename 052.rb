# It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, 
# but in a different order.

# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

# only need the first n*10/6 numbers since they must have the same number of digits

t1 = Time.now
found = false
start = 100
solution = 100

while !found
  sorted = start.to_s.chars.sort
  if (2*start).to_s.chars.sort == sorted 
    if (3*start).to_s.chars.sort == sorted 
      if (4*start).to_s.chars.sort == sorted 
        if (5*start).to_s.chars.sort == sorted         
          if (6*start).to_s.chars.sort == sorted          
            found = true
            solution = start
            break 
          end
        end
      end
    end
  end
  start += 1
end

puts "found #{start} in #{Time.now - t1}s"

# found 142857 in 0.650328s

