require 'spec_helper'

RSpec.describe Cipher do
  before :each do
    @cipher = Cipher.new
    @shift = ShiftGenerator.new
  end

  it 'exists' do
    expect(@cipher).to be_an Cipher
  end

  it 'returns 27 character set' do
    expect(@cipher.char_set).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '])
    end

  it 'indexes the char set' do
    expect(@cipher.indexed_char_set).to eq([['a', 0], ['b', 1], ['c', 2], ['d', 3], ['e', 4], ['f', 5], ['g', 6], ['h', 7], ['i', 8], ['j', 9], ['k', 10], ['l', 11], ['m', 12], ['n', 13], ['o', 14], ['p', 15], ['q', 16], ['r', 17], ['s', 18], ['t', 19], ['u', 20], ['v', 21], ['w', 22], ['x', 23], ['y', 24], ['z', 25], [' ', 26]])
  end

  it 'turns the incoming message to an array of all lower case' do
    expect(@cipher.split_message('hello world')).to eq(['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd'])
  end

  it 'returns char set index number for given letter' do
    message = 'hello world'
    @cipher.split_message(message)
    split_message = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]

    expect(@cipher.find_index(0)).to eq(7)
  end

  it 'returns the encrypted message' do
    @message = 'hello world'
    @cipher.split_message(@message)
    expect(@cipher.encrypt_message('hello world')).to eq('keder ohulw')
  end

  it 'decrypts the encrypted message' do
    @message = "keder ohulw"
    @cipher.split_message(@message)
    expect(@cipher.decrypt_message('keder ohulw')).to eq('hello world')
  end
end
