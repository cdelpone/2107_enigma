require 'date'

class ShiftGenerator
  attr_reader :all_shifts,
              :combo_keys,
              :combo_offsets,
              :random_nums

  def initialize
    @combo_keys = combo_keys
    @combo_offsets = combo_offsets
    @all_shifts = create_shifts(combo_keys, combo_offsets)
  end

  def random_nums
    nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @random_nums = nums.sample(5)
  end

  def random_key(random_nums)
    @random_nums.join.to_s
  end

  def assign_keys
    !random_nums
    @a_key = @random_nums[0, 2].join.to_i
    @b_key = @random_nums[1, 2].join.to_i
    @c_key = @random_nums[2, 2].join.to_i
    @d_key = @random_nums[3, 2].join.to_i
    @combo_keys = @a_key, @b_key, @c_key, @d_key
    @combo_keys.flatten
  end

  def transmission_date(date = nil)
    if @date.nil?
      @date = Date.today.strftime('%d%m%y'.gsub('yy', '%y'))
    end
    transmission_date = @date
  end

  def assign_offsets
    transmission_date
    new_date = (@date.to_i**2).to_s
    @a_offset = new_date[-4].to_i
    @b_offset = new_date[-3].to_i
    @c_offset = new_date[-2].to_i
    @d_offset = new_date[-1].to_i
    @combo_offsets = @a_offset, @b_offset, @c_offset, @d_offset
    @combo_offsets.flatten
  end

  def create_shifts(combo_keys, combo_offsets)
    assign_keys
    assign_offsets
    combo_keys = @a_key, @b_key, @c_key, @d_key
    combo_offsets = @a_offset, @b_offset, @c_offset, @d_offset
    shift = [combo_keys, combo_offsets].transpose.map(&:sum)
    @a_shift = shift[0]
    @b_shift = shift[1]
    @c_shift = shift[2]
    @d_shift = shift[3]
    shift
  end
end
