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

  def test_message
    shift = Shift.new
    message = 'Hi Ruby!'

    assert_equal ['h','i',' ','r','u','b','y','!'], shift.message(message)
  end

  def test_create_shift_for_message_length
    shift = Shift.new
    message = 'Hi Ruby!'

    shift.stubs(:key => "12345")
    shift.stubs(:date => "040895")

    assert_equal [13,23,36,50,13,23,36,50], shift.shift_size(message)
  end

  def test_original_alphabet
    shift = Shift.new

    expected = ["a", "b", "c", "d", "e", "f", "g", "h",
                "i", "j", "k", "l", "m", "n", "o", "p",
                "q", "r", "s", "t", "u", "v", "w", "x",
                "y", "z", " "]

    assert_equal expected, shift.og_alpha
  end

  def test_give_index
    shift = Shift.new
    message = 'Hi Ruby!'

    shift.stubs(:key => "12345")
    shift.stubs(:date => "040895")

    assert_equal [[13,0][23,1][36,2][50,3]], shift.combine_index
    assert_equal [["h",0]["i",1][" ",2]["r",3]["u",4]["b",5]["y",6]["!",7]], shift.message_index
  end

  def test_can_shift_by_combine_key
    shift = Shift.new
    message = 'Hi Ruby!'

    shift.stubs(:key => "12345")
    shift.stubs(:date => "040895")

    assert_equal 'ueingyg!', shift.new_message(message)
  end
end
