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

  def braille_translate
    return_message = Array.new(0)
    @alphabet.each do |key, value|
      return_message << value if @english_message.chars.include?(key)
    end
    return return_message
  end
end
