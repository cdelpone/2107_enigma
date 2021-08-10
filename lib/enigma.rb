require './lib/shift_generator'
require './lib/cipher'
require 'date'

class Enigma
  def encrypt(message, key = nil, date = nil)
    @cipher = Cipher.new(message, key, date)
    shift = @cipher.shift
    key = shift.key if key.nil?
    date = shift.transmission_date if date.nil?
    @encrypt = { encryption: @cipher.crypt_message(1), key: key, date: date }
  end

  def decrypt(message, key = nil, date = nil)
    @cipher = Cipher.new(message, key, date)
    date = @cipher.shift.date if date.nil?
    @decrypt = { decryption: @cipher.crypt_message(-1), key: key, date: date }
  end
end
