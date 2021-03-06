require 'date'

class ShiftGenerator
  attr_reader :key,
              :date

  def initialize(key, date)
    @key = key
    @date = date
    @all_shifts = all_shifts
  end

  def random_nums
    @key = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].sample(5).join.to_s
  end

  def assign_keys
    @key = random_nums if key.nil?
    [a_key = @key[0..1].to_i,
    b_key = @key[1..2].to_i,
    c_key = @key[2..3].to_i,
    d_key = @key[3..4].to_i]
  end

  def transmission_date(_date = nil)
    @date = Date.today.strftime('%d%m%y'.gsub('yy', '%y')) if @date.nil?
    @date
  end

  def assign_offsets
    transmission_date
    new_date = (@date.to_i**2).to_s
    [a_offset = new_date[-4].to_i,
    b_offset = new_date[-3].to_i,
    c_offset = new_date[-2].to_i,
    d_offset = new_date[-1].to_i]
  end

  def all_shifts
    assign_keys
    assign_offsets
    [assign_keys, assign_offsets].transpose.map(&:sum)
  end
end
