require_relative 'enigma'

class Encrypt

  @enigma_machine = Enigma.new

  file = File.open(ARGV.first, "r")

  text = file.read.chomp

  result = @enigma_machine.encrypt(text)

  file_output = ARGV.last

  new_file = File.open(file_output, "w")

  new_file.write(result[:encryption])

  puts "Created #{file} with the key 82648 and date 240818"
end
