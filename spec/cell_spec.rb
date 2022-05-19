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

  it "is not fired upon default" do
    @cell.place_ship(@cruiser)
    expect(@cell.fired_upon).to eq(false)
  end

  it "can be fired upon" do
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    expect(@cell.ship.health).to eq(2)
    expect(@cell.fired_upon).to eq(true)
  end

  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
  end

  it "can render an empty cell" do
    expect(@cell_1.render).to eq(".")
  end

  it "can tell you that there is a ship" do
    @cell_1.place_ship(@cruiser)
    expect(@cell_1.render(true)).to eq("S")
  end

  it "can tell that a ship has been sunk" do
    @cell_1.place_ship(@cruiser)
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    expect(@cell_1.render).to eq("X")
  end

  it "can tell that it's been hit" do
  @cell_1.place_ship(@cruiser)
  @cell_1.fire_upon
  expect(@cell_1.render).to eq("H")
  end

  it "can tell that it's only been hit in one spot" do
    @cell_1.place_ship(@cruiser)
    @cell_2.place_ship(@cruiser)
    @cell_1.fire_upon
    expect(@cell_1.render).to eq("H")
    expect(@cell_2.render(true)).to eq("S")
  end


  it "is able to miss" do
    @cell_1.fire_upon
    expect(@cell_1.render).to eq("M")
  end

end
