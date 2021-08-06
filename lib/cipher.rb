class Cipher
  attr_reader :encrypted_message

  def initialize
    @encrypted_message = []
    @new_message = []
  end

  def char_set
    ("a".."z").to_a << " "
  end

  def indexed_char_set
    @new_char_set = char_set.map.with_index(0).to_a
  end

  def split_message(message)
    # message.downcase.split('').flatten
    @new_message = (message.downcase.split("")).flatten
  end

  def find_index(index)
    @result = char_set.each_index.detect do |i|
      char_set[i] == @new_message[index]
    end
    @result
  end

  # def find_index(index, message)
  # indexed_ltr = indexed_char_set.detect do |index_set|
  #     index_set[0] == split_message(message)[index]
  #   end
  #   indexed_ltr[1]
  # end

  def encrypt_message
    shift = ShiftGenerator.new
    @new_message.each do |letter|
      find_index(@new_message.index(letter))
      new_char_index = @result + shift.all_shifts.rotate!(3)[0]
      @encrypted_message << char_set[new_char_index.to_i % 27]
    end
    @encrypted_message.join
  end
end
  # def encrypt_message(message)
  #   require "pry"; binding.pry
  #   shift = ShiftGenerator.new
  #   split_message(message).each do |letter|
  #     find_index(split_message(message).index(letter))
  #     new_char_index = find_index + shift.all_shifts.rotate!(3)[0]
  #     @encrypted_message << char_set[new_char_index.to_i % 27]
  #   end
  #   @encrypted_message.join
  # end
# end
