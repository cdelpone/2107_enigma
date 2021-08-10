require_relative 'enigma'

class Encrypt
  @enigma = Enigma.new

  file = File.open(ARGV.first, 'r')

  text = file.read.chomp

  result = @enigma.encrypt(text)

  file_output = ARGV.last

  new_file = File.open(file_output, 'w')

  new_file.write(result[:encryption])

  puts "Created #{file} with the key #{result[:key]} and date #{result[:date]}"
end
