# A common security method used for online banking is to ask the user for three random characters from a passcode. 
# For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected 
# reply would be: 317.

# The text file, keylog.txt, contains fifty successful login attempts.

# Given that the three characters are always asked for in order, analyse the file so as to determine the shortest 
# possible secret passcode of unknown length.

t1 = Time.now
keys = []
occurrences = {}
averaged = {}

file = File.new("keylog.txt", "r")
while (line = file.gets)
  keys.push line.strip
end
file.close

keys.each do |key|
  if occurrences[key[0,1]]
    occurrences[key[0,1]] += [0]
  else
    occurrences[key[0,1]] = [0]
  end

  if occurrences[key[1,1]]
    occurrences[key[1,1]] += [1]
  else
    occurrences[key[1,1]] = [1]
  end

  if occurrences[key[2,1]]
    occurrences[key[2,1]] += [2]
  else
    occurrences[key[2,1]] = [2]
  end  
end

occurrences.each do |key, positions|
  averaged[key] = ((positions.inject(:+) + 0.0) / positions.length)
end

passcode = ""
averaged.sort_by { |k, v| v }.each { |v| passcode << v[0] }

puts "found #{passcode} in #{Time.now - t1}s"
