# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first 
# ten triangle numbers are:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# By converting each letter in a word to a number corresponding to its alphabetical position 
# and adding these values we form a word value. For example, the word value for SKY 
# is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the 
# word a triangle word.

# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing 
# nearly two-thousand common English words, how many are triangle words?

# n = (sqrt(8x+1) - 1) / 2, according to math and wikipedia :)

def is_triangle_number(x)
  n = ( (8 * x + 1)**0.5 - 1) / 2
  n == n.to_i
end

t1 = Time.now
words_hash = {}
letters_hash = {}
count = 0

('A'..'Z').each_with_index do |letter, index|
  letters_hash[letter] = index + 1
end

file = File.new("words.txt", "r")
while (line = file.gets)
  line.split(',').each do |word|
    sum = 0
    word = word[1..-2]
    word.split('').each do |letter|
      break unless letter =~ /[[:alpha:]]/
      sum += letters_hash[letter]
    end
    words_hash[word] = sum
    count += 1 if is_triangle_number(sum)
  end    
end
file.close

puts "found #{count} in #{Time.now - t1}s"
