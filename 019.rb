=begin
 
 You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is 
divisible by 400.
How many Sundays fell on the first of the month during the twentieth 
century (1 Jan 1901 to 31 Dec 2000)? 
  
=end


# brute force
require 'date'

t1 = Time.now
d1 = Date.new(1901,01,01)
d2 = Date.new(2000,12,31)

count = 0

while d1 < d2
  if d1.sunday? && d1.day == 1
    count += 1 
  end
  d1 += 1
end

puts "found #{count} 1st Sundays in #{Time.now-t1}"

# found 171 1st Sundays in 0.017488