require './lib/nightwriter'

RSpec.describe do NightWriter
  before :each do
    @nightreader = NightWriter.new
  end

  it "can print a start message" do
    expect(@nightreader.start).to eq "created characters.txt containing 20 characters"
  end
end
