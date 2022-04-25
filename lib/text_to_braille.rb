require 'pry'
require "./lib/library_module"

class TexttoBraille < FileTranslate
include Library
  attr_reader :path_1, :path_2
  def initialize(path_1, path_2)
    @path_1 = path_1
    @path_2 = path_2
    @file_path = File.open(path_1, "r")
    @braille_text = File.open(path_2, "w")
    @english_message = @file_path.read.delete("\n")
    @alphabet = ENG_TO_BRA
  end

  def message_store
    return_array = Array.new(0)
    @english_message.chars.each do |letter|
      return_array << letter
    end
    return return_array
  end

  def message_translate
    translated_array = Array.new(0)
    message_store.each do |character|
      @alphabet.each do |key, value|
        translated_array << value if key == character
      end
    end
    return translated_array
  end

  def message_output
    transposed_sentences = Array.new(0)
    translated_braille = message_translate.each_slice(40).to_a
    transposed_places = Array.new(0)
    printed_braille = Array.new(0)
    braille_string = ""
    translated_braille.each do |sentence|
      transposed_sentences << sentence.transpose
    end
    transposed_sentences.each do |transposed_sentence|
      top = transposed_sentence[0].join
      mid = transposed_sentence[1].join
      bot = transposed_sentence[2].join
      transposed_places << [top, mid, bot]
    end
    transposed_places.each do |sentence|
      sentence.each do |line|
        printed_braille << line
      end
    end
    printed_braille.each do |other_line|
      braille_string += "#{other_line}\n"
    end
    return braille_string
  end

  def braille_start
    @file_path.close
    @braille_text.write(message_output)
    @braille_text.close
    puts "Created '#{@path_2}' containing #{file_length} characters"
  end
end
