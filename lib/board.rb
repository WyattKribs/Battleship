require './lib/cell'
class Board
  attr_reader :cells
  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(input)
    if @cells[input] == nil
      false
    else
      true
    end
  end

  # def overlap?
  #
  # end

  def valid_placement?(ship, coordinates)
    letter = []
    number = []

    coordinates.each do |coordinate|
      letter << coordinate.split("")[0].ord
      number << coordinate.split("")[1].to_i
    end

    coordinates.each do |coordinate|
      if @cells[coordinate].empty? != true
        return false
      end
    end

    if ship.length != coordinates.count
      false
    elsif letter.each_cons(2).all? {|a,b| b == a + 1} && number.each_cons(2).all? {|a,b| b == a}
      true
    elsif number.each_cons(2).all? {|a,b| b == a + 1} && letter.each_cons(2).all?{|a,b| b == a}
      true
    else
      false
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates) == true
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render(ship_rev = false)
    "  1 2 3 4 \nA #{@cells["A1"].render(ship_rev)} #{@cells["A2"].render(ship_rev)} #{@cells["A3"].render(ship_rev)} #{@cells["A4"].render(ship_rev)} \nB #{@cells["B1"].render(ship_rev)} #{@cells["B2"].render(ship_rev)} #{@cells["B3"].render(ship_rev)} #{@cells["B4"].render(ship_rev)} \nC #{@cells["C1"].render(ship_rev)} #{@cells["C2"].render(ship_rev)} #{@cells["C3"].render(ship_rev)} #{@cells["C4"].render(ship_rev)} \nD #{@cells["D1"].render(ship_rev)} #{@cells["D2"].render(ship_rev)} #{@cells["D3"].render(ship_rev)} #{@cells["D4"].render(ship_rev)} \n"
  end

end
