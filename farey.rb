# Displays a Farey sequence given the order

def farey(order)
  a, b, c, d = 0, 1, 1, order
  output =  "#{a}/#{b}"
  while c <= order
    k = (order + b) / d
    a, b, c, d = c, d, k*c - a, k*d - b
    output <<  " #{a}/#{b}"
  end
  puts output
end

(1..10).each do |i|
  farey i
end
