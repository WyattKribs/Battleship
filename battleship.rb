require './lib/board'
require './lib/ship'
require './lib/computer'

def welcome
  p 'Welcome to Battleship'
end

def player_choice
p 'Type P to play or Q to quit.'
end

def create_game
  @play_board = Board.new
  @comp_board = Board.new
  @play_cruiser = Ship.new("Cruiser", 3)
  @play_submarine = Ship.new("Submarine", 2)
  @comp_cruiser = Ship.new("Cruiser", 3)
  @comp_submarine = Ship.new("Submarine", 2)
  @computer = Computer.new
end

def the_game
  loop do
    player_choice
    play_or_quite = gets.chomp.upcase
    if play_or_quite == 'P'
      create_game
      p 'place your ships!'
      puts @play_board.render
      loop do
        p 'place the cruiser, pick 3 consecutive positions'
        cruiser_place = []
        3.times do
          cruiser_place << gets.chomp.upcase
        end
        if @play_board.valid_placement?(@play_cruiser, cruiser_place) == true
          @play_board.place(@play_cruiser, cruiser_place)
          break
        else
          p 'invalid placement, pick again'
          puts @play_board.render(true)
        end
      end
      puts @play_board.render(true)
      loop do
        p 'place the submarine, pick 2 consecutive positions'
        submarine_place = []
        2.times do
          submarine_place << gets.chomp.upcase
        end
        if @play_board.valid_placement?(@play_submarine, submarine_place) == true
          @play_board.place(@play_submarine, submarine_place)
          break
        else
          p 'invalid placement, pick again'
          puts @play_board.render(true)
        end
      end
                    #####RENDER COMP SHIPS#######
      loop do
        submarine_place = @computer.place_ship(@comp_submarine.length)
        if @comp_board.valid_placement?(@comp_submarine, submarine_place) == true
          @comp_board.place(@comp_submarine, submarine_place)
          break
        end
      end
      loop do
        cruiser_place = @computer.place_ship(@comp_cruiser.length)
        if @comp_board.valid_placement?(@comp_cruiser, cruiser_place) == true
          @comp_board.place(@comp_cruiser, cruiser_place)
          break
        else
        end
      end
                        ###FIRE AT SHIPS#####
      loop do
        p "=============COMPUTER BOARD============="
        puts @comp_board.render
        if @play_submarine.sunk? && @play_cruiser.sunk?
          puts "You have lost take the L"
          break
        elsif @comp_cruiser.sunk? && @comp_submarine.sunk?
          puts "Congratulations You Won"
          break
        end
        p "==============PLAYER BOARD=============="
        puts @play_board.render(true)
        if @play_submarine.sunk? && @play_cruiser.sunk?
          puts "You have lost take the L"
          break
        elsif @comp_cruiser.sunk? && @comp_submarine.sunk?
          puts "Congratulations You Won"
          break
        end

        p "Enter the coordinate for your shot:"
        loop do
          player_shot = gets.chomp.upcase
          if @comp_board.cells[player_shot] == nil
            p "Please enter a valid coordinate:"
          elsif @comp_board.cells[player_shot].fired_upon == false
            @comp_board.cells[player_shot].fire_upon
            if @comp_board.cells[player_shot].render == "H"
              puts "That's a HIT"
            elsif @comp_board.cells[player_shot].render == "X"
              puts "You SUNK its ship"
            else
              puts "That's a MISS"
            end
            break
          elsif @comp_board.cells[player_shot].fired_upon == true
            p "Please enter a valid coordinate:"
          end
        end
        loop do
          comp_shot = @computer.hit
          if @play_board.cells[comp_shot].fired_upon == false
            @play_board.cells[comp_shot].fire_upon
            if @play_board.cells[comp_shot].render == "H"
              puts "Your ship is HIT"
            elsif @play_board.cells[comp_shot].render == "X"
              puts "Your ship is SUNK"
            else
              puts "The enemy MISSED"
            end
            break
          elsif @play_board.cells[comp_shot].fired_upon == true
          end
        end
      end
    elsif play_or_quite == 'Q'
      break
    else
      p 'pick again'
    end
  end
end

welcome
the_game
