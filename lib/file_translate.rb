class FileTranslate

  attr_reader :file_path, :path_1, :path_2
  def initialize(path_1, path_2)
    @path_1 = path_1
    @path_2 = path_2
    @file_path = File.open(path_1, "r")
    @output = File.open(path_2, "w")
    @english_message = @file_path.read.delete("\n")
  end

  def file_length
    @english_message.length
  end

  def start
    @file_path.close
    @output.write(@english_message)
    @output.close
    puts "Created '#{@path_2}' containing #{file_length} characters"
  end

end
