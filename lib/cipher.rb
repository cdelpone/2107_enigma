class Cipher
  attr_reader :encrypted_message,
              :decrypted_message,
              :message

  def initialize(message)
    @message = message
    @encrypted_message = []
    @decrypted_message = []
  end

  def char_set
    ("a".."z").to_a << " "
  end

  def change_message
    pattern = /(\'|\!|\?|\,|\"|\.|\*|\/|\-|\\)/
    message.downcase.gsub(pattern, "").split("")
  end

  def find_index(index)
    @result = char_set.each_index.detect do |i|
      char_set[i] == change_message[index]
    end
  end

  def encrypt_message
    shift = ShiftGenerator.new('02715', '040895')
    current_shift = shift.all_shifts
    change_message.each do |letter|
      find_index(change_message.index(letter))
      new_char_index = @result.to_i + (current_shift[0]).to_i
      @encrypted_message << char_set[new_char_index.to_i % 27]
      current_shift = current_shift.rotate
    end
    @encrypted_message.join
  end

  def decrypt_message
    shift = ShiftGenerator.new('02715', '040895')
    current_shift = shift.all_shifts
    change_message.each do |letter|
      find_index(change_message.index(letter))
      new_char_index = @result.to_i - (current_shift[0]).to_i
      @decrypted_message << char_set[new_char_index.to_i % 27]
      current_shift = current_shift.rotate
    end
    @decrypted_message.join
    # require "pry"; binding.pry
  end
end
