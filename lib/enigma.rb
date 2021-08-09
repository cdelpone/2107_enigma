require './lib/shift_generator'
require './lib/cipher'
require 'date'

class Enigma
  attr_reader :encrypt,
              :decrypt,
              :key,
              :date,
              :message

  def initialize
    @encrypt = {}
    @decrypt = {}
    @shift = ShiftGenerator.new(key, date)
  end

  def encrypt(message, key = nil, date = nil)
    @cipher = Cipher.new(message, key, date)
    shift = @cipher.shift
    key = shift.key if key.nil?
    date = shift.transmission_date if date.nil?
    message = message

    @encrypt = {encryption: @cipher.encrypt_message, key: key, date: date}

    @encrypt
  end

  def decrypt(message, key = nil, date = nil)
    @encrypt

    @cipher = Cipher.new(message, key, date)
    @cipher.shift
    date = @cipher.shift.date if date.nil?

    @decrypt = {decryption: @cipher.decrypt_message, key: key, date: date}

    @decrypt
  end
end
