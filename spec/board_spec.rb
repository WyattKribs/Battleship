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
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("C4")).to eq(true)
    expect(@board.valid_coordinate?("A11")).to eq(false)
  end

  it "can validate proper length" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it "make sure the coordinates are consecutive" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
    expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
  end

  it "coordinates can’t be diagonal" do
    expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
  end

  it "should check if placement is valid" do
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
    expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it "can place ships" do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expect(@board.cells["A1"].empty?).to eq(false)
    expect(@board.cells["A2"].empty?).to eq(false)
    expect(@board.cells["A3"].empty?).to eq(false)
  end

  it "will only place ships if the coordinates are valid" do
    @board.place(@cruiser, ["A1", "A2", "A4"])
    expect(@board.cells["A1"].empty?).to eq(true)
    expect(@board.cells["A2"].empty?).to eq(true)
    expect(@board.cells["A4"].empty?).to eq(true)
  end

  it "is able to check no ships are overlapping" do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
  end

  it "can render the board" do
    expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
  end

  it "can render the ships on the board" do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expect(@board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end

  it "can render sunk ships" do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    expect(@board.render).to eq("  1 2 3 4 \nA X X X . \nB . . . . \nC . . . . \nD . . . . \n")
  end

  it "can render misses" do
    @board.cells["A1"].fire_upon
    expect(@board.render).to eq("  1 2 3 4 \nA M . . . \nB . . . . \nC . . . . \nD . . . . \n")
  end
end
