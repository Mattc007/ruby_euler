# Each character on a computer is assigned a unique code and the preferred standard is ASCII 
# (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, 
# and lowercase k = 107.

# A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a 
# given value, taken from a secret key. The advantage with the XOR function is that using the same encryption 
# key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

# For unbreakable encryption, the key is the same length as the plain text message, and the key is made up 
# of random bytes. The user would keep the encrypted message and the encryption key in different locations, 
# and without both "halves", it is impossible to decrypt the message.

# Unfortunately, this method is impractical for most users, so the modified method is to use a password as 
# a key. If the password is shorter than the message, which is likely, the key is repeated cyclically 
# throughout the message. The balance for this method is using a sufficiently long password key for 
# security, but short enough to be memorable.

# Your task has been made easy, as the encryption key consists of three lower case characters. Using 
#   cipher1.txt (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and 
#   the knowledge that the plain text must contain common English words, decrypt the message and find the sum 
#   of the ASCII values in the original text.

t1 = Time.now
cipher_text = File.new('cipher1.txt').gets.split(',').map! { |num| num.to_i }
password = ""
decoded_text_count = 0
invalid_password = false
max_space_count, max_e_count = 0, 0

# frequency analysis " " (32), e (101) are two most common

('a'..'z').each do |first_character|
  ('a'..'z').each do |second_character|
    ('a'..'z').each do |third_character|
      candidate = first_character + second_character + third_character
      i = 0
      space_count, e_count, current_text_count = 0, 0, 0
      text = ""
      while i < cipher_text.length
        invalid_password = false
        value = cipher_text[i] ^ candidate[i % 3]
        if value < 32 || value > 122   # invalid characters
          invalid_password = true
          break
        end
        space_count += 1 if value == 32
        e_count += 1 if value == 101
        text << value.chr
        current_text_count += value
        i += 1
      end
      unless invalid_password
        if space_count >= max_space_count && e_count >= max_e_count
          password = candidate
          max_space_count, max_e_count = space_count, e_count
          decoded_text_count = current_text_count
        end
      end
    end
  end
end

puts "found #{decoded_text_count} for password = '#{password}' in #{Time.now - t1}s"
# found 107359 for password = 'god' in 0.610612s
