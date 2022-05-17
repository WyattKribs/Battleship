require './lib/ship'
require './lib/cell'


describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  it "is an instance of cell" do
    expect(@cell).to be_a(Cell)
  end

  it "has coordinates" do
    expect(@cell.coordinate).to eq("B4")
  end

  it "cell has no ship by default " do

  expect(@cell.ship).to eq(nil)
  end

  it "cell is empty" do
    expect(@cell.empty?).to eq(true)
  end

  it "Can place a ship" do
    @cell.place_ship(@cruiser)
    expect(@cell.ship).to eq(@cruiser)
  end

  it "Tell us the cell has a ship" do
    @cell.place_ship(@cruiser)
    expect(@cell.empty?).to eq(false)
  end



end
