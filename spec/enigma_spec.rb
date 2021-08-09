require 'spec_helper'

RSpec.describe Enigma do

  before :each do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_an Enigma
  end

  it 'encrypts' do
    expected = {
                encryption: 'keder ohulw',
                key: '02715',
                date: '040895'
              }
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it 'decrypts' do
    expected = {
                decryption: 'hello world',
                key: '02715',
                date: '040895'
              }
    expect(@enigma.decrypt('keder ohulw', '02715', '040895')).to eq(expected)
  end

  it 'encrypts a message with a key and todays day' do
    date = Date.today.strftime('%d%m%y'.gsub('yy', '%y'))

    expected = {
                encryption: 'keder ohulw',
                key: '02715',
                date: date
              }
    expect(@enigma.encrypt("hello world", "02715")).to eq(expected)
  end

  it 'encrypts a message with a randomly generated key and todays date' do
    date = Date.today.strftime('%d%m%y'.gsub('yy', '%y'))

    expected = {
                encryption: 'keder ohulw',
                key: 'xyzqr',
                date: date
              }
    expect(@enigma.encrypt("hello world")).to eq(expected)
  end

  it 'decrypts a message with a key as todays day' do
    date = Date.today.strftime('%d%m%y'.gsub('yy', '%y'))

    expected = {
                decryption: 'hello world',
                key: '02715',
                date: date
              }
    expect(@enigma.decrypt('keder ohulw', "02715")).to eq(expected)
  end

end
