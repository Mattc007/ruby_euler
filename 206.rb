# Find the unique positive integer n whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.

# to end in a 0, n must end in a 0
# to end in a 900, n must end in a 30 or 70

t1 = Time.now
max = Math.sqrt(1929394959697989990).ceil
min = Math.sqrt(1020304050607080900).floor

min_30 = min - (min % 100) + 30
min_70 = min - (min % 100) + 70

solution = 0

[min_30, min_70].each do |start|
  break unless solution == 0
  (start...max).step(100) do |n|
    r = n**2
    if (r.to_s =~ /1\d2\d3\d4\d5\d6\d7\d8\d9\d0/) == 0
      solution = n
      break
    end
  end
end

puts "found #{solution} in #{Time.now - t1}s"
# found 1389019170 in 9.218243s
