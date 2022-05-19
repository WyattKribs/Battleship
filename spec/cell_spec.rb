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

  it "is able to miss" do
    @cell_1.fire_upon
    expect(@cell_1.render).to eq("M")
  end

  it "Can place a ship" do
    @cell_2.place_ship(@cruiser)
    expect(@cell_2.ship).to eq(@cruiser)
  end

  it "can render an empty cell" do
    expect(@cell_2.render).to eq(".")
  end

  it "will render ship if render(true) is passed" do
    @cell_2.place_ship(@cruiser)
    expect(@cell_2.render).to eq(".")
    expect(@cell_2.render(true)).to eq("S")
  end

  it "wont render a ship if it isnt there" do
    expect(@cell_2.render(true)).to eq(".")
  end

  it "detects cell 2 to be fired upon" do
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon
    expect(@cell_2.render).to eq("H")
  end

  it "detects if if cell_2 has sunk?" do
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon
    expect(@cruiser.sunk?).to eq(false)
  end

  it "detects if cruiser has sunk? == true" do
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon
    @cruiser.hit
    @cruiser.hit
    expect(@cruiser.sunk?).to eq(true)
  end

  it "renders an X when it has sunk?" do
  @cell_2.place_ship(@cruiser)
  @cell_2.fire_upon
  @cruiser.hit
  @cruiser.hit
  expect(@cell_2.render).to eq("X")
end

end
