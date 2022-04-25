require 'simplecov'
SimpleCov.start
require './lib/file_translate'
require 'rspec'
require 'pry'

RSpec.describe FileTranslate do
  before :each do
    # ARGV = ["message_test.txt", "braille_test.txt"]
    @translator = FileTranslate.new("message_test.txt", "braille_test.txt")
    @file_path = File.open("message_test.txt", "r")
    @output = File.open("braille_test.txt", "w")
  end

  it "can create a file path" do
    expect(@translator.file_path).to be_a File
  end

  it "can read the length of a file" do
    expect(@translator.file_length).to eq 29
  end

  it "can create a start message" do
    expect(@translator.start).to eq NIL
    # p instead of puts prints "Created braille_test.txt containing 29 characters"
    # in pry we get returned
    # Created braille_test.txt containing 29 characters
    # => nil
    # when using puts
  end

end
