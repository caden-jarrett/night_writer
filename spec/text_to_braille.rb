require './lib/file_translate'
require './lib/text_to_braille'
require 'simplecov'
SimpleCov.start
require 'rspec'
require 'pry'

RSpec.describe do TexttoBraille
  before :each do
    ARGV = ["it2_message_test.txt", "it2_braille_test.txt"]
    @translator = FileTranslate.new
    @english_translator = TexttoBraille.new
    @file_path = File.open(ARGV[0], "r")
    @output = File.open(ARGV[1], "w")
    @english_message = @file_path.read.delete("\n")
  end

  it "exists" do
    expect(@english_translator).to be_a_instance_of TexttoBraille
  end

  it "can store each character from the message.txt file" do
    expect(@english_translator.message_store).to eq ["a", "a", "a"]
  end

  it "can inpput the braille equivalent to an array" do
    expect(@english_translator.message_translate).to eq [["O.", "..", ".."], ["O.", "..", ".."], ["O.", "..", ".."]]
  end

  it "can translate each character from the message_translate array" do
    expect(@english_translator.message_output).to eq ["a", "a", "a"]
  end
end
