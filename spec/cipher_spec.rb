require 'spec_helper'

RSpec.describe Cipher do
  before :each do
    @cipher = Cipher.new('Hello world!', '02715', '040895')
    @cipher2 = Cipher.new('keder ohulw!', '02715', '040895')
  end

  it 'exists' do
    expect(@cipher).to be_an Cipher
    expect(@cipher.message).to eq('Hello world!')
    expect(@cipher.encrypted_message).to eq([])
    expect(@cipher.encrypted_message).to eq([])
    expect(@cipher.shift).to be_a ShiftGenerator
  end

  it 'returns 27 character set' do
    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']
    expect(@cipher.char_set).to eq(expected)
  end

  it 'turns the incoming message to an array of all lower case' do
    expect(@cipher.change_message).to eq(['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd', '!'])
  end

  it 'returns char set index number for given letter' do
    expect(@cipher.find_index(0)).to eq(7)
    # expect().to eq()
  end

  it 'returns the encrypted message' do
    expect(@cipher.encrypt_message).to eq('keder ohulw!')
  end

  it 'decrypts the encrypted message' do
    expect(@cipher2.decrypt_message).to eq('hello world!')
  end
end
