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
  
end
