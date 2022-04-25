require 'pry'
class TexttoBraille < FileTranslate

  attr_reader :path_1, :path_2
  def initialize(path_1, path_2)
    @path_1 = path_1
    @path_2 = path_2
    @file_path = File.open(path_1, "r")
    @braille_text = File.open(path_2, "w")
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
    return translated_array #.each_slice(40).to_a
  end

  # def message_output
  #   binding.pry
  #   translated_braille = message_translate
  #   transposed = translated_braille.transpose
  #   top = transposed[0].join.to_s
  #   mid = transposed[1].join.to_s
  #   bot = transposed[2].join.to_s
  #   braille = "#{top}\n#{mid}\n#{bot}"
  #   binding.pry
  # end

  def message_output
    translated_braille = message_translate
    transposed = translated_braille.transpose
    if transposed[0].count < 40
      top = transposed[0][0..39].join.to_s
      mid = transposed[1][0..39].join.to_s
      bot = transposed[2][0..39].join.to_s
      braille = "#{top}\n#{mid}\n#{bot}"
    elsif transposed[0].count > 40 && transposed[0].count < 80
      top = transposed[0][0..39].join.to_s
      mid = transposed[1][0..39].join.to_s
      bot = transposed[2][0..39].join.to_s
      top2 = transposed[0][40..79].join.to_s
      mid2 = transposed[1][40..79].join.to_s
      bot2 = transposed[2][40..79].join.to_s
      braille = "#{top}\n#{mid}\n#{bot}\n#{top2}\n#{mid2}\n#{bot2}"
    else
      top = transposed[0][0..39].join.to_s
      mid = transposed[1][0..39].join.to_s
      bot = transposed[2][0..39].join.to_s
      top2 = transposed[0][40..79].join.to_s
      mid2 = transposed[1][40..79].join.to_s
      bot2 = transposed[2][40..79].join.to_s
      top3 = transposed[0][80..119].join.to_s
      mid3 = transposed[1][80..119].join.to_s
      bot3 = transposed[2][80..119].join.to_s
      braille = "#{top}\n#{mid}\n#{bot}\n#{top2}\n#{mid2}\n#{bot2}\n#{top3}\n#{mid3}\n#{bot3}"
    end
    binding.pry
    return braille
  end

  def braille_start
    @file_path.close
    @braille_text.write(message_output)
    @braille_text.close
    puts "Created '#{@path_2}' containing #{file_length} characters"
  end
end
