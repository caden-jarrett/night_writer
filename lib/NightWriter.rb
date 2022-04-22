class NightWriter

  attr_reader :file_path
  def initialize
    @file_path = File.open(ARGV[0], "r")
  end

  def start
    start_message = file_path.read.delete("\n")
    file_path.close
    file_length = start_message.length
    output = File.open(ARGV[1], "w")
    output.write(start_message)
    output.close
    puts "created #{ARGV[1]} containing #{file_length} characters"
  end

end
