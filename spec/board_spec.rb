require './lib/board'

describe Board do
  before(:each) do
    @board = Board.new
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
end
