require './lib/shift_generator'

class Cipher
  attr_reader :encrypted_message,
              :decrypted_message,
              :message,
              :shift

  def initialize(message, key, date)
    @message = message
    @encrypted_message = []
    @decrypted_message = []
    @shift = ShiftGenerator.new(key, date)
  end

  def char_set
    ("a".."z").to_a << " "
  end

  def change_message
    message.downcase
  end

  def find_index(index)
    @result = char_set.each_index.detect do |i|
      char_set[i] == change_message[index]
    end
  end

  def encrypt_message
    current_shift = @shift.all_shifts
    change_message.each do |letter|
      find_index(change_message.index(letter))
      new_char_index = @result.to_i + (current_shift[0]).to_i
      @encrypted_message << char_set[new_char_index.to_i % 27]
      current_shift = current_shift.rotate
    end
    @encrypted_message.join
  end

  def decrypt_message
    current_shift = @shift.all_shifts
    change_message.each do |letter|
      find_index(change_message.index(letter))
      new_char_index = @result.to_i - (current_shift[0]).to_i
      @decrypted_message << char_set[new_char_index.to_i % 27]
      current_shift = current_shift.rotate
    end
    @decrypted_message.join
  end
end
