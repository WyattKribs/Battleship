require './lib/ship'
require './lib/cell'


describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
  end

  it "is an instance of cell" do
    expect(@cell).to be_a(Cell)
  end

  it "has coordinates" do
    expect(@cell.coordinate).to eq("B4")
  end


end
