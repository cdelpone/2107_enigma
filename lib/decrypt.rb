require_relative 'enigma'

class Decrypt

  @enigma = Enigma.new

  file = File.open(ARGV[0], "r")

  text = file.read.chomp

  result = @enigma.decrypt(text, ARGV[2], ARGV[3])

  file_output = ARGV[1]

  new_file = File.open(file_output, "w")

  new_file.write(result[:decryption])

  puts "Created #{file} with the key #{result[:key]} and date #{result[:date]}"
end

# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
# encrypted.txt (arg[0]) => read the excrypted message here
# decrypted.txt (arg[1]) => write decrypted message
# 82648 (arg[2]) => key for decryption
# 240818 (arg[3]) => date for decryption
