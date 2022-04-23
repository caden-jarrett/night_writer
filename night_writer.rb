# this is the runner file
require "./lib/nightwriter"

nightwriter = NightWriter.new(ARGV[0], ARGV[1])
nightwriter.start


# file_path = File.open(ARGV[0], "r")
# output = File.open(ARGV[1], "w")
# start_message = file_path.read.delete("\n")
# file_path.close
# file_length = start_message.length
# output.write(start_message)
# output.close
# puts "created #{ARGV[1]} containing #{file_length} characters"
