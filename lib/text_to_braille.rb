require 'pry'
class TexttoBraille < FileTranslate

  def initialize
    @file_path = File.open(ARGV[0], "r")
    @braille_text = File.open(ARGV[1], "w")
    @english_message = @file_path.read.delete("\n")
  end

  def braille_translate

  end
end
