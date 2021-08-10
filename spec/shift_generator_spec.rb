require 'spec_helper'

RSpec.describe ShiftGenerator do
  before :each do
    @shift = ShiftGenerator.new('02715', '040895')
    @shift2 = ShiftGenerator.new('02715', date = nil)

  end

  it 'exists' do
    expect(@shift).to be_a ShiftGenerator
    expect(@shift.key).to eq('02715')
    expect(@shift.date).to eq('040895')
  end

  it 'generates 5 random digits' do
    expect(@shift.random_nums.class).to eq String
    expect(@shift.random_nums.length).to eq 5
  end

  it 'returns random number as a string' do
    expect(@shift.random_nums).to be_a String
    expect(@shift.random_nums.length).to eq 5
  end

  it 'returns keys an array' do
    expect(@shift.assign_keys.class).to eq Array
    expect(@shift.assign_keys).to eq([02, 27, 71, 15])
  end

  it 'returns todays date as a string' do
    expect(@shift.transmission_date).to eq('040895')
    expect(@shift2.transmission_date).to eq("090821")
  end

  it 'returns and assigns offsets' do
    expect(@shift.assign_offsets.class).to eq Array
    expect(@shift.assign_offsets).to eq([1, 0, 2, 5])
  end

  it 'can create shifts' do
    expect(@shift.all_shifts).to eq([3, 27, 73, 20])
  end
end
