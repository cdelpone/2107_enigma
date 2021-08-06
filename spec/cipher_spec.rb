require 'spec_helper'

RSpec.describe Cipher do

  before :each do
    @cipher = Cipher.new
  end

  it 'exists' do
    expect(@cipher).to be_an Cipher
  end
