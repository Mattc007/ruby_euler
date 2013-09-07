# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of 
# each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string 
# divisibility property.

# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17
# Find the sum of all 0 to 9 pandigital numbers with this property.

t1 = Time.now

# observations:

# d4d5d6=635 is divisible by 5
#    ==> d6 is divisible by 5 ===> d6 = {0,5}
# d5d6d7=357 is divisible by 7
#    ==> 
# d6d7d8=572 is divisible by 11
#    ==> d6 = {0,5} : if d6 = 0, then d7d8 = {11,22,33,..99} which have repeats so d6 != 0
#    ===> d6 = 5 ====> d6d7d8 = {506,517,528,539,561,572,583,594}
# d7d8d9=728 is divisible by 13
#    ==> d6d7d8 = {506,517,528,539,561,572,583,594} 
#    ===> d6d7d8d9 = {5065,5286,5390,5611,5728,5832,5949}
#    ====> remove repeats, d6d7d8d9 = {5286,5390,5728,5832}
# d8d9d10=289 is divisible by 17
#    ==> d6d7d8d9d10 = {52867,53901,57289,58323}
#    ===> remove repeats, d6d7d8d9d10 = {52867,53901,57289}
# d5d6d7=357 is divisible by 7
#    ==> d6d7d = {52,53,57}
#    ===> d5d6d7d = {252,553,357,952}
#    ====> remove repeats, d5d6d7d = {357,952}
#    =====> d5d6d7d8d9d10d = {357289,952867}
# d2d3d4=406 is divisible by 2  
#    ==> d4 is divisible by 2 ===> d4 = {0,2,4,6,8} 
#    ===> d4d5d6d7d8d9d10d = {0357289,4357289,6357289,0952867,4952867}
# d3d4d5=063 is divisible by 3
#    ==> d4d5 = {03,43,63,09,49}
#    ===> sum of digits must be divisible by 3, 
#         d3d4d5d6d7d8d9d10 = {60357289,06357289,30952867}
# we're missing 1 & 4, so 
numbers = [1460357289,1406357289,1430952867,4160357289,4106357289,4130952867]

puts "found #{numbers.reduce(:+)} in #{Time.now - t1}s"
# found 16695334890 in 1.6e-05s