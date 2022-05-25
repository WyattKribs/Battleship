require './lib/computer'
require './lib/ship'

describe Computer do
  before(:each) do
    @computer = Computer.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it "can make arrays of the correct length" do
    expect(@computer.place_ship(@cruiser.length).length).to eq(3)
  end
  
end
