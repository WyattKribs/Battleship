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
  
end
