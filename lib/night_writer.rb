require_relative 'braillemap'
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
    if char == char.upcase && char != " "
      Hash[char, CHAR_TO_BRAILLE.fetch('^') + CHAR_TO_BRAILLE.fetch(char.downcase)]
    else
      Hash[char, CHAR_TO_BRAILLE.fetch(char)]
    end
  end

end

if __FILE__ == $0
nw = NightWriter.new
# binding.pry
puts nw.convert_to_braille("hello")

end
