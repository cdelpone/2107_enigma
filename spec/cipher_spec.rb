require 'spec_helper'

RSpec.describe Cipher do

  before :each do
    @cipher = Cipher.new
  end

  it 'exists' do
    expect(@cipher).to be_an Cipher
  end

  it 'returns 27 character set' do
    expect(@cipher.char_set).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '])
  end

end
