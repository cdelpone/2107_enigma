require './lib/shift_generator'
require './lib/cipher'

class Enigma
  attr_reader :encrypt,
              :new_keys,
              :new_date

  def initialize
    @encrypt = {}
    @decrypt = {}
    @shift = ShiftGenerator.new
    @cipher = Cipher.new
    @new_keys = @shift.random_key(@random_nums)
    @new_date = @shift.transmission_date
  end

  def encrypt(message, key = @new_keys, date = @new_date)
    @encrypt = {}
    message = @cipher.split_message(message)
    @encrypt[:encryption] = @cipher.encrypt_message(message)
    @encrypt[:key] = key
    @encrypt[:date] = date
    @encrypt
  end

  def decrypt(message, key, date)
    @decrypt = {}
    @decrypt[:decryption] = message if @decrypt[:decryption].nil?
    @decrypt[:key] = key if @decrypt[:key].nil?
    @decrypt[:date] = date if @decrypt[:date].nil?
    @decrypt
  end
end
