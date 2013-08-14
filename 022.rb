=begin

Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing 
over five-thousand first names, begin by sorting it into alphabetical order. Then working 
out the alphabetical value for each name, multiply this value by its alphabetical position 
in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is 
worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would 
obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?

=end

t1 = Time.now
contents = File.read('names.txt')
names = contents.tr('"','').split(',').sort
letters_score = {}
('A'..'Z').each_with_index do |val, index| 
  letters_score[val] = index+1 
end

names_score = {}
names.each_with_index do |val, index|
  q = 0
  val.split('').each do |x|
    q += letters_score[x]
  end
  names_score[val] = (index+1) * q
end

puts "found #{names_score.values.inject(:+)} in #{Time.now - t1}s"

# found 871198282 in 0.069372s

