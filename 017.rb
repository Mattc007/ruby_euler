=begin
If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, 
how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) 
contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use 
of "and" when writing out numbers is in compliance with British usage.

=end

def spelled_out(n)

  spelled = { 
              "1"=>["one"],
              "2"=>["two", "twenty"],
              "3"=>["three", "thirty"],
              "4"=>["four", "forty"],
              "5"=>["five", "fifty"],
              "6"=>["six", "sixty"],
              "7"=>["seven", "seventy"],
              "8"=>["eight", "eighty"],
              "9"=>["nine", "ninety"],
              "10"=>["ten"],
              "11"=>["eleven"],
              "12"=>["twelve"],
              "13"=>["thirteen"],
              "14"=>["fourteen"],
              "15"=>["fifteen"],
              "16"=>["sixteen"],
              "17"=>["seventeen"],
              "18"=>["eighteen"],
              "19"=>["nineteen"]
            }

  return spelled[n.to_s].first if spelled.key?(n.to_s)

  str = ""
  x = y = z = 0

  # thousands
  if (x = (n / 1000).to_i) > 0
    str << spelled[x.to_s].first << " thousand" if spelled.key?(x.to_s)
    n -= (x * 1000)
  end

  # hundreds
  if (y = (n / 100).to_i).between?(1,9)
    str << spelled[y.to_s].first << " hundred" if spelled.key?(y.to_s)
    n -= (y * 100)
  end

  # tens
  if (z = (n / 10).to_i).between?(2,9)
    str << " and " if str.length != 0
    str << spelled[z.to_s][1] if spelled.key?(z.to_s)
    n -= (z * 10)
  elsif z.between?(0,2)
    str << " and " if (str.length != 0 and n != 0)
    str << spelled[n.to_s].first if spelled.key?(n.to_s)
    n = 0
  end

  # ones
  if n.to_i.between?(1,9)
    str << "-" if z.between?(1,9) 
    str << spelled[n.to_s].first if spelled.key?(n.to_s)
  end

  return str

end

t1 = Time.now
sum = 0
1000.downto(1).each do |i|
  sum += spelled_out(i).gsub(/\W+/,'').length
end

puts "#{sum} characters found in #{Time.now-t1}s"

# 21124 characters found in 0.026806s