class Computer
  attr_reader :logic
  def initialize
    @logic = [
      "A1", "A2", "A3", "A4",
      "B1", "B2", "B3", "B4",
      "C1", "C2", "C3", "C4",
      "D1", "D2", "D3", "D4"
    ]
  end

  def hit
    @logic.shuffle[0]
  end


  def place_ship(ship_length)
    ship_array = []
    placement = []
      @logic.each do |coordinate|
        ship_array << coordinate
      end
    placement = ship_array.shuffle[1..ship_length]
    placement
  end
end
