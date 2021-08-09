require './lib/shift_generator'
require './lib/cipher'
require 'date'

class Enigma
  attr_reader :encrypt,
              :decrypt,
              :key,
              :date

  def initialize
    @encrypt = {}
    @decrypt = {}
  end

  def encrypt(message, key = nil, date = nil)
    shift = ShiftGenerator.new(key, date)
    cipher = Cipher.new(message)
    key = shift.key #if key.nil?
    date = shift.transmission_date #if date.nil?
    @message = message
    @encrypt[:encryption] = cipher.encrypt_message
    @encrypt[:key] = key
    @encrypt[:date] = date
    @encrypt
  end

  def decrypt(message, key = nil, date = nil)
    shift = ShiftGenerator.new(key, date)
    cipher = Cipher.new(message)
    key = @encrypt[:key] if key.nil?
    date = shift.transmission_date #if date.nil?
    message = @encrypt[:encryption]
    @decrypt[:decryption] = cipher.decrypt_message
    @decrypt[:key] = key
    @decrypt[:date] = date
    @decrypt
  end
end
