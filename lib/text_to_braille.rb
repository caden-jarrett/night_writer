require 'pry'
require "./lib/library_module"

class TexttoBraille < FileTranslate
include Library
  attr_reader :path_1, :path_2, :printed_braille
  def initialize(path_1, path_2)
    @path_1 = path_1
    @path_2 = path_2
    @file_path = File.open(path_1, "r")
    @braille_text = File.open(path_2, "w")
    @english_message = @file_path.read.delete("\n")
    @alphabet = ENG_TO_BRA
    @printed_braille = Array.new(0)
    @transposed_places = Array.new(0)
    @transposed_sentences = Array.new(0)
    @braille_string = ""
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

  def transpose_sentences
    translated_braille = message_translate.each_slice(40).to_a
    translated_braille.each do |sentence|
      @transposed_sentences << sentence.transpose
    end
    # binding.pry
    return @transposed_sentences
  end

  def split_transposed_sentences
    @transposed_sentences.each do |transposed_sentence|
      # binding.pry
      top = transposed_sentence[0].join
      mid = transposed_sentence[1].join
      bot = transposed_sentence[2].join
      @transposed_places << [top, mid, bot]
    end
    return @transposed_places
  end

  def join_braille
    @transposed_places.each do |sentence|
      sentence.each do |line|
        @printed_braille << line
      end
    end
    # binding.pry
    return @printed_braille
  end

  def populate_braille_string
    @printed_braille.each do |other_line|
      @braille_string += "#{other_line}\n"
    end
    # binding.pry
    return @braille_string
  end


  def braille_start
    transpose_sentences
    split_transposed_sentences
    join_braille
    @file_path.close
    @braille_text.write(populate_braille_string)
    @braille_text.close
    puts "Created '#{@path_2}' containing #{file_length} characters"
  end
end
