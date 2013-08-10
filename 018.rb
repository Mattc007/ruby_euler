=begin
 
By starting at the top of the triangle below and moving to adjacent numbers on the row below, 
the maximum total from top to bottom is 23.
  
   3
  7 4
 2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

              75
             95 64
            17 47 82
           18 35 87 10
          20 04 82 47 65
         19 01 23 75 03 34
        88 02 77 73 07 63 67
       99 65 04 28 06 16 70 92
      41 41 26 56 83 40 80 70 33
     41 48 72 33 47 32 37 16 94 29
    53 71 44 65 25 43 91 52 97 51 14
   70 11 33 28 77 73 17 78 39 68 17 57
  91 71 52 38 17 14 91 43 58 50 27 29 48
 63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23  

=end

t1 = Time.now

triangle = "  75
             95 64
            17 47 82
           18 35 87 10
          20 04 82 47 65
         19 01 23 75 03 34
        88 02 77 73 07 63 67
       99 65 04 28 06 16 70 92
      41 41 26 56 83 40 80 70 33
     41 48 72 33 47 32 37 16 94 29
    53 71 44 65 25 43 91 52 97 51 14
   70 11 33 28 77 73 17 78 39 68 17 57
  91 71 52 38 17 14 91 43 58 50 27 29 48
 63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23  "

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

# found max sum of 1074 in 0.000598s








