require './lib/board'
require './lib/ship'

def welcome
  p 'Welcome to Battleship'
end

def player_choice
p 'type p to play or q to quit'
end

def create_game
  @play_board = Board.new
  @comp_board = Board.new
  @play_cruiser = Ship.new("Cruiser", 3)
  @play_submarine = Ship.new("Submarine", 2)
  @comp_cruiser = Ship.new("Cruiser", 3)
  @comp_submarine = Ship.new("Submarine", 2)
end

def comp_placement
  
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
      puts @play_board.render(true)
    elsif play_or_quite == 'Q'
      break
    else
      p 'pick again'
    end
  end
end

welcome
the_game
