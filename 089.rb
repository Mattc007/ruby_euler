# Find the number of characters saved by writing each of these in their minimal form.

# Note: You can assume that all the Roman numerals in the file contain no more than
# four consecutive identical units.

# I = 1
# V = 5
# X = 10
# L = 50
# C = 100
# D = 500
# M = 1000

t1 = Time.now
numeral_text = []
original_length = 0
updated_length = 0

file = File.new("roman.txt", "r")
while (line = file.gets)
    numeral_text.push(line.tr("\n",""))
    original_length += numeral_text.last.length
end
file.close

numeral_text.each do |numeral|
  updated_length += numeral.gsub(/DCCCC/, 'CM').gsub(/LXXXX/, 'XC').gsub(/VIIII/, 'IX').gsub(/CCCC/, 'CD').gsub(/XXXX/, 'XL').gsub(/IIII/, 'IV').length
end

puts "found #{original_length - updated_length} in #{Time.now - t1}s"
# found 743 in 0.006808s

