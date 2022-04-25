require 'simplecov'
SimpleCov.start
require './lib/file_translate'
require './lib/text_to_braille'
require 'rspec'
require 'pry'

# command to run spec test for iteration_2 on runner: ruby ./lib/night_writer.rb ./spec_txt/it2_message_test.txt ./spec_txt/it2_braille_test.txt
RSpec.describe TexttoBraille do

  before :each do
    @translator = FileTranslate.new("./spec_txt/it2_message_test.txt", "./spec_txt/it2_braille_test.txt")
    @english_translator = TexttoBraille.new("./spec_txt/it2_message_test.txt", "./spec_txt/it2_braille_test.txt")
    @file_path = File.open("./spec_txt/it2_message_test.txt", "r")
    @output = File.open("./spec_txt/it2_braille_test.txt", "w")
    @english_message = @file_path.read.delete("\n")
  end

  it "exists" do
    expect(@english_translator).to be_a_instance_of TexttoBraille
  end

  it "can store each character from the message.txt file" do
    # binding.pry
    expect(@english_translator.message_store.join).to eq "hello world this is more than forty characters"
  end

  it "can input the braille equivalent to an array" do
    # binding.pry
    expect(@english_translator.message_translate.join).to eq "O.OO..O..O..O.O.O.O.O.O.O..OO........OOO.OO..OO.O.OOO.O.O.O.OO.O.........OOOO.O.OO...OO....OO.O........OO....OO.O.......OO..O.O..OO.O.OOO.O..O.........OOOO.O.OO..O.....OO.OO.......OOO...O..OO.O.OOO..OOOO.OO.OOO......OO....O.OO..O.....O.OOO.O.....OO.....OOOO.O..O..O.OOO..OO.O."
  end

  it "can transpose the translated sentences of the braille array" do
    # binding.pry
    expect(@english_translator.transpose_sentences).to be_a Array
    expect(@english_translator.transpose_sentences).to eq  [[["O.","O.","O.","O.","O.","..",".O","O.","O.","O.","OO","..",".O","O.",".O",".O","..",".O",".O","..","OO","O.","O.","O.","..",".O","O.","O.","OO","..","OO","O.","O.",".O","OO","..","OO","O.","O.","O."],["OO",".O","O.","O.",".O","..","OO",".O","OO","O.",".O","..","OO","OO","O.","O.","..","O.","O.","..","..",".O","OO",".O","..","OO","OO","..",".O","..","O.",".O","OO","OO",".O","..","..","OO","..","OO"],["..","..","O.","O.","O.","..",".O","O.","O.","O.","..","..","O.","..","..","O.","..","..","O.","..","O.","O.","O.","..","..","O.","..","..","O.","..","..","O.","O.","O.","OO","..","..","..","..","O."]],[["O.", "OO", ".O", "O.", "O.", ".O"],["..", "..", "OO", ".O", "OO", "O."],["..", "..", "O.", "..", "O.", "O."]]]
  end

  # it "can translate each character from the message_translate array" do
  #   @english_translator.transpose_sentences
  #   # binding.pry
  #   expect(@english_translator.split_transposed_sentences).to eq [["O.O.O.O.O....OO.O.O.OO...OO..O.O...O.O..OOO.O.O....OO.O.OO..OOO.O..OOO..OOO.O.O.","OO.OO.O..O..OO.OOOO..O..OOOOO.O...O.O......OOO.O..OOOO...O..O..OOOOO.O....OO..OO","....O.O.O....OO.O.O.....O.....O.....O...O.O.O.....O.....O.....O.O.O.OO........O."],["O.OO.OO.O..O", "....OO.OOOO.", "....O...O.O."]]
  # end
end
