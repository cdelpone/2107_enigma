require 'spec_helper'

RSpec.describe Enigma do

  before :each do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_an Enigma
  end

  xit 'encrypts' do
    expected = {
                encryption: 'keder ohulw',
                key: '02715',
                date: '040895'
              }
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  xit 'decrypts' do
    expected = {
                decryption: 'hello world',
                key: '02715',
                date: '040895'
              }
    expect(@enigma.decrypt('keder ohulw', '02715', '040895')).to eq(expected)
  end

  xit 'encrypts a message with a key as todays day' do
    # expected = encryption hash

    encrypted = enigma.encrypt("hello world", "02715")
  end

  xit 'decrypts a message with a key as todays day' do
    # expected = decryption hash

    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to eq(expected)
  end

  xit 'encrypts a message with a randomly generated key and todays date' do
    # expected = encryption hash

    expect(@enigma.encrypt("hello world")).to eq(expected)
  end
end
