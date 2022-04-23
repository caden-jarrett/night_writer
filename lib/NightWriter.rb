class NightWriter

  attr_reader :file_path
  def initialize(english_txt, braille_txt)
    @file_path = File.open(ARGV[0], "r")
    @output = File.open(ARGV[1], "w")
  end

  def start
    start_message = @file_path.read.delete("\n")
    @file_path.close
    file_length = start_message.length
    @output.write(start_message)
    @output.close
    p "created #{ARGV[1]} containing #{file_length} characters"
  end
end
