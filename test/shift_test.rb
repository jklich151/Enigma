require_relative 'test_helper'
require './lib/shift'
require 'date'

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new

    assert_instance_of Shift, shift
  end

  def test_has_attributes
    shift = Shift.new

    assert_instance_of Array, shift.key
    assert_equal 5, shift.key.length
    assert_equal 6, shift.date.length
  end

  def test_split_key
    shift = Shift.new

    shift.stubs(:key => "12345")
    expected = [12,23,34,45]

    assert_equal expected, shift.key_split
  end

  def test_key_is_random
    shift = Shift.new
    shift1 = Shift.new
    shift2 = Shift.new

    refute shift.key == shift1.key
    refute shift1.key == shift2.key
    refute shift.key == shift2.key
  end

  def test_date_is_not_random
    shift = Shift.new
    shift1 = Shift.new
    shift2 = Shift.new

    assert shift.date == shift1.date
    assert shift1.date == shift2.date
    assert shift.date == shift2.date
  end

  def test_split_date
    shift = Shift.new

    shift.stubs(:date => "040895")
    expected = [1,0,2,5]

    assert_equal expected, shift.date_split
  end

  def test_combine_date_and_key
    shift = Shift.new

    shift.stubs(:key => "12345")
    shift.stubs(:date => "040895")
    
    assert_equal [13,23,36,50], shift.combine
  end
end
