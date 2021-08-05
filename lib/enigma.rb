class Enigma

  def initialize
    shift = ShiftGenerator.new
  end

  def encrypt(message, key, date)
    # Takes a message String as an argument.
    # It can optionally take a Key and Date as arguments to use for encryption.
      # message is a string
    # If the key is not included, generate a random key.
      # if key.nil? key = randomly generated key
    # If the date is not included, use today’s date.
      # if date.nil? date = todays_date
    encrypt = {}
    encrypt[:encryption] #=> encrypted String
    encrypt[:key] #=> key used for encryption as a String
    encrypt[:date] #=> date used for encryption as a String in the form DDMMYY
  end

  def decrypt(ciphertext, key, date)
    # The decrypt method takes a ciphertext String and the Key used for encryption as arguments.
      # ciphertext is a string
    # The decrypt method can optionally take a date as the third argument.
    # If no date is given, this method should use today’s date for decryption.
      # if date.nil? date = todays_date
    decrypt = {}
    decrypt[:decryption] #=> decrypted String
    decrypt[:key] #=> key used for decryption as a String
    decrypt[:date] #=> date used for decryption as a String in the form DDMMYY
  end

end
