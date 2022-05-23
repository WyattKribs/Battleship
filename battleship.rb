require './lib/board'
require './lib/ship'

def welcome
  p 'Welcome to Battleship'
end

def player_choice
p 'type p to play or q to quit'
end

def create_game
  play_board = Board.new
  comp_board = Board.new
  play_cruiser = Ship.new("Cruiser", 3)
  play_submarine = Ship.new("Submarine", 2)
  comp_cruiser = Ship.new("Cruiser", 3)
  comp_submarine = Ship.new("Submarine", 2)
end

def the_game
  loop do
    player_choice
    play_or_quite = gets.chomp.upcase
    if play_or_quite == 'P'
      create_game

    elsif play_or_quite == 'Q'
      break
    else
      p 'pick again'
    end
  end
end

welcome
the_game
