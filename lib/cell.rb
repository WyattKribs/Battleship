class Cell
attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    if ship == nil
      true
    elsif ship != nil
      false
    end
  end

  def place_ship(ship_name)
    @ship = ship_name
  end

  def fired_upon?
    if empty? == false && ship.sunk? == false && ship.health < ship.length
      true
    elsif empty? == true
       true
    else
      false
    end
  end

  def fire_upon
    if empty? == false
      ship.hit
    elsif empty? == true

    end
  end


  def render
    if empty? == false && ship.sunk? == false && fired_upon? == false
      "S"
    elsif empty? == false && ship.sunk? == true
      "X"
    elsif empty? == false && fired_upon? == true && ship.sunk? == false
      "H"
    elsif empty? == true
      "."
    end
  end
end
