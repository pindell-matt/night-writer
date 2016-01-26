require_relative 'test_helper'
require_relative '../lib/night_writer'
require 'pry'

class NightWriterTest < Minitest::Test

  def test_converts_one_char_to_braille
    night_writer = NightWriter.new
    char = "h"
    submitted = night_writer.print_braille(char)
    expected = "0.\n00\n.."

    assert_equal expected, submitted
  end

end
