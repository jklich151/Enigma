require_relative 'test_helper'
require './lib/enigma'
require './lib/shift'
require 'date'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_encrypt
    enigma = Enigma.new
    expected = { encryption: 'keder ohulw',
                 key: '02715',
                 date: '040895' }

    assert_equal expected, enigma.encrypt('hello world', '02715', '040895')
  end

  def test_decrypt
    enigma = Enigma.new

    expected = { decryption: 'hello world',
                 key: '02715',
                 date: '040895' }

    assert_equal expected, enigma.decrypt('keder ohulw', '02715', '040895')
  end
end
