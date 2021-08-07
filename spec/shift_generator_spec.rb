require 'spec_helper'

RSpec.describe ShiftGenerator do
  before :each do
    @shift = ShiftGenerator.new
  end

  it 'exists' do
    expect(@shift).to be_a ShiftGenerator
  end

  it 'generates 5 random digits' do
    expect(@shift.random_nums.class).to eq Array
    expect(@shift.random_nums.length).to eq 5
  end

  it 'returns random number as a string' do
    expect(@shift.random_key([9, 4, 3, 8, 7])).to be_a String
    expect(@shift.random_key([9, 4, 3, 8, 7]).length).to eq 5
  end

  xit 'returns keys an array' do
    # allow(@shift.assign_keys).to receive(:random_nums).and_return([9, 4, 3, 7, 1])
    # expect(@shift.assign_keys).to eq [94, 43, 37, 71]
    expect(@shift.assign_keys.class).to eq Array
  end

  # it 'squares the transmission date' do
  #   date = Date.today.strftime('%d%m%y'.gsub('yy', '%y')) if date.nil?
  #
  #   expect(@shift.transmission_date).to eq("5015614041")
  # end
  it 'returns todays date as a string' do
    date = Date.today.strftime('%d%m%y'.gsub('yy', '%y')) if date.nil?

    expect(@shift.transmission_date).to eq(date)
  end

  xit 'returns and assigns offsets' do
    # allow(@shift.transmission_date('040895')).to receive(:date).and_return('040895')
    # expected = a_offset = 1,
    #            b_offset = 0,
    #            c_offset = 2,
    #            d_offset = 5
    #
    expect(@shift.assign_offsets.class).to eq Array
  end

  it 'can create shifts' do
    combo_keys = [51, 16, 69, 90]
    combo_offsets = [4, 0, 4, 1]
    # @a_shift = shift.values_at(0)
    # @b_shift = shift.values_at(1)
    # @c_shift = shift.values_at(2)
    # @d_shift = shift.values_at(3)
    shift = [55, 16, 73, 91]
    expect(@shift.create_shifts(combo_keys, combo_offsets)).to eq([55, 16, 73, 91])
  end
end
