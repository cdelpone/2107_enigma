require 'date'

class ShiftGenerator
  attr_reader :assign_keys,
              :assign_offsets,
              :all_shifts,
              :date

  def initialize
    @assign_keys = assign_keys
    @assign_offsets = assign_offsets
    @all_shifts = create_shifts(assign_keys, assign_offsets)
  end

  def random_nums
    nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @random_nums = nums.sample(5)
  end

  def assign_keys
    random_nums
    @a_key = @random_nums[0, 2].join.to_i
    @b_key = @random_nums[1, 2].join.to_i
    @c_key = @random_nums[2, 2].join.to_i
    @d_key = @random_nums[3, 2].join.to_i
    combo_keys = @a_key, @b_key, @c_key, @d_key
    combo_keys.flatten
  end

  def transmission_date(date = nil)
    date = Date.today.strftime('%d%m%y'.gsub('yy', '%y')) if date.nil?
    date = (date.to_i**2).to_s
  end

  def assign_offsets
    split_date = transmission_date.split('')
    @a_offset = split_date.values_at(-4).map(&:to_i)
    @b_offset = split_date.values_at(-3).map(&:to_i)
    @c_offset = split_date.values_at(-2).map(&:to_i)
    @d_offset = split_date.values_at(-1).map(&:to_i)
    combo_offsets = @a_offset, @b_offset, @c_offset, @d_offset
    combo_offsets.flatten
  end

  def create_shifts(assign_keys, assign_offsets)
    shift = [assign_offsets, assign_keys].transpose.map(&:sum)
    @a_shift = shift.values_at(0)
    @b_shift = shift.values_at(1)
    @c_shift = shift.values_at(2)
    @d_shift = shift.values_at(3)
    shift
  end
end
