class Cipher
  attr_reader :encrypted_message

  def initialize
    @encrypted_message = []
    @message = []
  end

  def char_set
    ("a".."z").to_a << " "
  end

  def indexed_char_set
    @new_char_set = char_set.map.with_index(0).to_a
  end

  def split_message(message)
    @message = (message.downcase.split("")).flatten
  end

  def find_index(index)
    @result = char_set.each_index.detect do |i|
      char_set[i] == @message[index]
    end
    @result
  end

  def encrypt_message(message)
    shift = ShiftGenerator.new
    @message.each do |letter|
      find_index(@message.index(letter))
      new_char_index = @result + shift.all_shifts.rotate!(3)[0]
      @encrypted_message << char_set[new_char_index.to_i % 27]
    end
    @encrypted_message.join
  end
end
