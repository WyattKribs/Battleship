require './lib/board'
require './lib/ship'

describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it "is an instance of Board" do
    expect(@board).to be_a(Board)
  end

  it "can verify coordinates" do
    # require 'pry' ; binding.pry
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("C4")).to eq(true)
    expect(@board.valid_coordinate?("A11")).to eq(false)
  end

  it "can validate placement" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
  end

end
