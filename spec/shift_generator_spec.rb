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

  it 'returns keys an array' do
    # allow(@shift.assign_keys).to receive(:random_nums).and_return([9, 4, 3, 7, 1])
    # expect(@shift.assign_keys).to eq [94, 43, 37, 71]
    expect(@shift.assign_keys.class).to eq Array
  end

  it 'returns todays date as a string' do
    date = Date.today.strftime('%d%m%y'.gsub('yy', '%y')) if date.nil?

    expect(@shift.transmission_date).to eq(date)
  end

  it 'returns and assigns offsets' do
    # allow(@shift.transmission_date('040895')).to receive(:date).and_return('040895')
    # expected = a_offset = 1,
    #            b_offset = 0,
    #            c_offset = 2,
    #            d_offset = 5
    #
    expect(@shift.assign_offsets.class).to eq Array
  end

  it 'can create shifts' do
    assign_keys = [02, 27, 71, 15]
    assign_offsets = [1, 0, 2, 5]
    expect(@shift.create_shifts(assign_keys, assign_offsets)).to eq([03, 27, 73, 20])
  end
end
