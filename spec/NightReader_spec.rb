require './lib/nightwriter'
require 'pry'

RSpec.describe do NightWriter
  before :each do
    ARGV = ["message_test.txt", "braille_test.txt"]
    @nightwriter = NightWriter.new('message_test.txt', 'braille_test.txt')
    @file_path = File.open(ARGV[0], "r")
    @output = File.open(ARGV[1], "w")
  end

  it "can create a file path" do
    expect(@nightwriter.file_path).to be_a File
  end

  it "can create a start message" do
    expect(@nightwriter.start).to eq "created braille_test.txt containing 29 characters"
  end
end
