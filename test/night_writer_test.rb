require_relative 'test_helper'
require_relative '../lib/night_writer'
require 'pry'

class NightWriterTest < Minitest::Test

  def setup
    @night_writer = NightWriter.new
  end

  def test_converts_one_char
    char = "a"
    submitted = @night_writer.convert_to_braille(char)
    expected = "0.\n..\n.."

    assert_equal expected, submitted
  end

  def test_converts_one_word
    char = "hello"
    submitted = @night_writer.convert_to_braille(char)
    expected = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."

    assert_equal expected, submitted
  end

  def test_convers_one_phrase
    char = "hello world"
    submitted = @night_writer.convert_to_braille(char)
    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."

    assert_equal expected, submitted
  end

  def test_converts_uppercase_char
    char = "A"
    submitted = @night_writer.convert_to_braille(char)
    expected = "..0.\n....\n.0.."

    assert_equal expected, submitted
  end

end
