require 'pry'
class TexttoBraille < FileTranslate

  def initialize
    @file_path = File.open(ARGV[0], "r")
    @braille_text = File.open(ARGV[1], "w")
    @english_message = @file_path.read.delete("\n")
    @alphabet = {
      'a' => ['O.','..','..'],
      'b' => ['O.','O.','..'],
      'c' => ['OO','..','..'],
      'd' => ['OO','.O','..'],
      'e' => ['O.','.O','..'],
      'f' => ['OO','O.','..'],
      'g' => ['OO','OO','..'],
      'h' => ['O.','OO','..'],
      'i' => ['.O','O.','..'],
      'j' => ['.O','OO','..'],
      'k' => ['O.','..','O.'],
      'l' => ['O.','O.','O.'],
      'm' => ['OO','..','O.'],
      'n' => ['OO','.O','O.'],
      'o' => ['O.','.O','O.'],
      'p' => ['OO','O.','O.'],
      'q' => ['OO','OO','O.'],
      'r' => ['O.','OO','O.'],
      's' => ['.O','O.','O.'],
      't' => ['.O','OO','O.'],
      'u' => ['O.','..','OO'],
      'v' => ['O.','O.','OO'],
      'w' => ['.O','OO','.O'],
      'x' => ['OO','..','OO'],
      'y' => ['OO','.O','OO'],
      'z' => ['O.','.O','OO'],
      ' ' => ['..','..','..']
    }
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
    translated_braille = message_translate
    transposed = translated_braille.transpose
    top = transposed[0].join.to_s
    mid = transposed[1].join.to_s
    bot = transposed[2].join.to_s
    braille = "#{top}\n#{mid}\n#{bot}"
    return braille
  end

  def braille_start
    @file_path.close
    @braille_text.write(message_output)
    @braille_text.close
    puts "Created '#{ARGV[1]}' containing #{file_length} characters"
  end
end
