require 'simplecov'
SimpleCov.start
require './lib/file_translate'
require './lib/text_to_braille'
require 'rspec'
require 'pry'

RSpec.describe TexttoBraille do

  before :each do
    @translator = FileTranslate.new("it2_message_test.txt", "it2_braille_test.txt")
    @english_translator = TexttoBraille.new("it2_message_test.txt", "it2_braille_test.txt")
    @file_path = File.open("it2_message_test.txt", "r")
    @output = File.open("it2_braille_test.txt", "w")
    @english_message = @file_path.read.delete("\n")
  end

  it "exists" do
    expect(@english_translator).to be_a_instance_of TexttoBraille
  end

  it "can store each character from the message.txt file" do
    # binding.pry
    expect(@english_translator.message_store).to eq ["a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a",
     "a"]

  end

  it "can inpput the braille equivalent to an array" do
    # binding.pry
    expect(@english_translator.message_translate).to eq [["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."],
  ["O.", "..", ".."]]

  end

  it "can translate each character from the message_translate array" do
    binding.pry
    expect(@english_translator.message_output).to eq "O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.O.\n............................................................................................................\n............................................................................................................"
  end
end
