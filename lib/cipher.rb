require './lib/shift_generator'

class Cipher
  attr_reader :message,
              :shift

  def initialize(message, key, date)
    @message = message
    @shift = ShiftGenerator.new(key, date)
  end

  def char_set
    ('a'..'z').to_a << ' '
  end

  def change_message
    message.downcase.split('')
  end

  def find_index(index)
    @char_index = char_set.each_index.detect do |i|
      char_set[i] == change_message[index]
    end
  end

  def crypt_message(direction)
    crypted_message = []
    current_shift = @shift.all_shifts
    change_message.each do |letter|
      if char_set.include?(letter)
        find_index(change_message.index(letter))
        new_char_index = @char_index.to_i + (direction * (current_shift[0]).to_i)
        crypted_message << char_set[new_char_index % 27]
        current_shift = current_shift.rotate
      else crypted_message << letter
      end
    end
    crypted_message.join
  end
end
