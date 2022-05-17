require './lib/ship'

describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it "is an instance of Ship" do
    expect(@cruiser).to be_a(Ship)
  end

  it "has a name" do
    expect(@cruiser.name).to eq("Cruiser")
  end

  it "has a length" do
    expect(@cruiser.length).to eq(3)
  end

  it "has health" do
    expect(@cruiser.health).to eq(3)
  end

  it "isn't sunk by default" do
    expect(@cruiser.sunk?).to eq(false)
  end

  it "can be hit" do
    @cruiser.hit
    expect(@cruiser.health).to eq(2)
  end

  it "can be hit multiple times" do
    @cruiser.hit
    @cruiser.hit
    expect(@cruiser.health).to eq(1)
  end

  it "can be sunk" do
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    expect(@cruiser.health).to eq(0)
    expect(@cruiser.sunk?).to eq(true)
  end
end
