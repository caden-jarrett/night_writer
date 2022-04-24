require './lib/file_translate'
require './lib/text_to_braille'
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

  it "can run a translation to brailie" do
    expect(@english_translator.braille_translate). to eq [["O.", "..", ".."], ["O.", "O.", ".."], ["OO", "..", ".."]]
  end
end
