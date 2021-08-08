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
    expect(@shift.assign_keys.class).to eq Array
  end

  it 'returns todays date as a string' do
    date = Date.today.strftime('%d%m%y'.gsub('yy', '%y')) if date.nil?

    expect(@shift.transmission_date).to eq(date)
  end

  it 'returns and assigns offsets' do
    expect(@shift.assign_offsets.class).to eq Array
  end

  it 'can create shifts' do
    expect(@shift.create_shifts(combo_keys, combo_offsets)).to eq([55, 16, 73, 91])
  end
end
