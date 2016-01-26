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

  def test_converts_two_chars
    char = "ab"
    submitted = @night_writer.convert_to_braille(char)
    expected = "0.0.\n..0.\n...."

    assert_equal expected, submitted
  end

  def test_converts_one_uppercase_char
    char = "A"
    submitted = @night_writer.convert_to_braille(char)
    expected = "..0.\n....\n.0.."

    assert_equal expected, submitted
  end

  def test_converts_two_uppercase_char
    char = "AB"
    submitted = @night_writer.convert_to_braille(char)
    expected = "..0...0.\n......0.\n.0...0.."

    assert_equal expected, submitted
  end

  def test_converts_one_word
    char = "hello"
    submitted = @night_writer.convert_to_braille(char)
    expected = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."

    assert_equal expected, submitted
  end

  def test_converts_one_phrase
    char = "hello world"
    submitted = @night_writer.convert_to_braille(char)
    expected = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."

    assert_equal expected, submitted
  end

  def test_converts_41_chars_to_82_braille
    chars = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    submitted = @night_writer.convert_to_braille(chars)
    expected = 82

    assert_equal expected, submitted.split("\n").first.length
  end

  def test_converts_all_characters
    skip
    all = " !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    submitted = @night_writer.convert_to_braille(all)
    expected = 92
    binding.pry

    assert_equal expected, submitted.split("\n").first.length
  end
end
