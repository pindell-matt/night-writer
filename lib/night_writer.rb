require_relative 'char_to_braille'
require 'pry'

class NightWriter
  include BrailleMap

  def convert_to_braille(phrase)
    process_rows(convert_word(phrase))
  end

  def process_rows(processed_word)
    first_row = processed_word.map do |hash|
      hash.values[0][0]
    end

    second_row = processed_word.map do |hash|
      hash.values[0][1]
    end

    third_row = processed_word.map do |hash|
      hash.values[0][2]
    end

    first_row.join("") + "\n" + second_row.join("") + "\n" + third_row.join("")
  end

  def convert_word(word)
    word.chars.map { |char| char_lookup(char) }
  end

  def char_lookup(char)
    Hash[char, CHAR_TO_BRAILLE.fetch(char)]
  end

end

if __FILE__ == $0

# char_to_braille = {'a' => [['0', '.'], ['.', '.'], ['.', '.']],
#                    'b' => [['0', '.'], ['0', '.'], ['.', '.']],
#                    'c' => [['0', '0'], ['.', '.'], ['.', '.']],
#                    'd' => [['0', '0'], ['.', '0'], ['.', '.']],
#                    'e' => [['0', '.'], ['.', '0'], ['.', '.']],
#                    'f' => [['0', '0'], ['0', '.'], ['.', '.']],
#                    'g' => [['0', '0'], ['0', '0'], ['.', '.']],
#                    'h' => [['0', '.'], ['0', '0'], ['.', '.']],
#                    'i' => [['.', '0'], ['0', '.'], ['.', '.']],
#                    'j' => [['.', '0'], ['0', '0'], ['.', '.']],
#                    'k' => [['0', '.'], ['.', '.'], ['0', '.']],
#                    'l' => [['0', '.'], ['0', '.'], ['0', '.']],
#                    'm' => [['0', '0'], ['.', '.'], ['0', '.']],
#                    'n' => [['0', '0'], ['.', '0'], ['0', '.']],
#                    'o' => [['0', '.'], ['.', '0'], ['0', '.']],
#                    'p' => [['0', '0'], ['0', '.'], ['0', '.']],
#                    'q' => [['0', '0'], ['0', '0'], ['0', '.']],
#                    'r' => [['0', '.'], ['0', '0'], ['0', '.']],
#                    's' => [['.', '0'], ['0', '.'], ['0', '.']],
#                    't' => [['.', '0'], ['0', '0'], ['0', '.']],
#                    'u' => [['0', '.'], ['.', '.'], ['0', '0']],
#                    'v' => [['0', '.'], ['0', '.'], ['0', '0']],
#                    'w' => [['.', '0'], ['0', '0'], ['.', '0']],
#                    'x' => [['0', '0'], ['.', '.'], ['0', '0']],
#                    'y' => [['0', '0'], ['.', '0'], ['0', '0']],
#                    'z' => [['0', '.'], ['.', '0'], ['0', '0']],
#                    '!' => [['.', '.'], ['0', '0'], ['0', '.']],
#                    "'" => [['.', '.'], ['.', '.'], ['0', '.']],
#                    ',' => [['.', '.'], ['0', '.'], ['.', '.']],
#                    '.' => [['.', '.'], ['0', '0'], ['.', '0']],
#                    '-' => [['.', '.'], ['.', '.'], ['0', '0']],
#                    '?' => [['.', '.'], ['0', '.'], ['0', '0']],
#                    '#' => [['.', '0'], ['.', '0'], ['0', '0']],
#                    ' ' => [['.', '.'], ['.', '.'], ['.', '.']]}
#
# word = "hello world"
#
# result = word.chars.map do |char|
#   Hash[char, char_to_braille.fetch(char)]
# end
#
# binding.pry
#
# first_row = result.map do |hash|
#   hash.values[0][0]
# end
#
# second_row = result.map do |hash|
#   hash.values[0][1]
# end
#
# third_row = result.map do |hash|
#   hash.values[0][2]
# end
#
# combined = first_row.join("") + "\n" + second_row.join("") + "\n" + third_row.join("")
# puts combined
#
# tested = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."
#
# puts tested
#
# puts tested == combined

nw = NightWriter.new
puts nw.convert_to_braille("hello")

end
