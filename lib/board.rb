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

  def valid_placement?(ship, coordinates)
    range = "A1".."D4"
    letter = []
    number = []

    range.each do |coordinate|
      letter << coordinate.split("")[0].ord
      number << coordinate.split("")[1].to_i
    end

    if ship.length != coordinates.count
      false
    elsif number.each_cons(2).all? {|a,b| b == a + 1} && letter.each_cons(2).all?{|a,b| b == a}
      true
    elsif letter.each_cons(2).all?{|a,b| b == a + 1} && number.each_cons(2).all? {|a,b| b == a}
      true
    else
      false
    end
  end
end
