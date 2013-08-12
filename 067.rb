=begin
 
By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.

NOTE: This is a much more difficult version of Problem 18. 
It is not possible to try every route to solve this problem, as there are 299 altogether! 
If you could check one trillion (1012) routes every second it would take over twenty billion 
years to check them all. There is an efficient algorithm to solve it. ;o)

=end

t1 = Time.now
triangle = ""

file = File.new("triangle.txt", "r")
while (line = file.gets)
    triangle << line
end
file.close


def process_triangle(tri_string)
  arr = tri_string.gsub!(/\D+/,'').scan(/\d\d/).map(&:to_i)
  tri_arr = []
  arr.each_with_index do |val, index|
    if index == 0
      tri_arr.push([val])
    else
      row_array = tri_arr.pop
      if tri_arr[-1] && (row_array.length < tri_arr[-1].length + 1)
        row_array.push(val)
        tri_arr.push(row_array)
      else
        tri_arr.push(row_array)
        tri_arr.push([val])
      end
    end
  end

  return tri_arr
end

tri_arr = process_triangle(triangle).reverse

while tri_arr.length > 1
  new_row_arr = []
  tri_arr[1].each_with_index do |row_val, row_index|
    a = row_val + tri_arr[0][row_index]
    b = row_val + tri_arr[0][row_index + 1] 
    a > b ? new_row_arr.push(a) : new_row_arr.push(b)
  end
  tri_arr[1] = new_row_arr
  tri_arr.shift
end

puts "found max sum of #{tri_arr} in #{Time.now-t1}s"

# found max sum of 7273 in 0.024424s








