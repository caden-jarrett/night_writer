class FileTranslate

  attr_reader :file_path
  def initialize
    @file_path = File.open(ARGV[0], "r")
    @output = File.open(ARGV[1], "w")
    @english_message = @file_path.read.delete("\n")
  end

  def file_length
    @english_message.length
  end

  def start
    @file_path.close
    @output.write(@english_message)
    @output.close
    puts "Created '#{ARGV[1]}' containing #{file_length} characters"
  end

end
