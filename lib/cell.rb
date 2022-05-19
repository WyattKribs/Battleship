class Cell
attr_reader :coordinate, :ship, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship_name)
    @ship = ship_name
  end


    def fire_upon
      @fired_upon = true
      if @ship != nil
        @ship.hit
      end

    end

    def render(ship_rev = false)
      if empty? == true && fired_upon == true
        "M"
      elsif ship_rev == true && empty? == false
        "S"
      elsif empty? == false && ship.sunk? == true
        "X"
      elsif empty? == false && fired_upon == true && ship.sunk? == false
        "H"
      elsif empty? == true
        "."
      end
    end
  end
