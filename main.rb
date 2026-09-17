#frozen_string_literal: true

require 'pry-byebug'
require_relative './lib/instructions'
require_relative './lib/fen/load_fen'
require_relative './lib/board'
require_relative './lib/space'
require_relative './lib/player'

include Messages
puts Messages::INSTRUCTIONS   # HOW TO PLAY

# LINE 17
# Contains fen_string which holds piece location of new or prev games
loader = FenLoad.new('./lib/fen/saves/new_game.fen')

# Board calls 'make_board' which fills individual pieces to oppropriate
# individual spaces that make up the board.

# make_board is board.rb LINE 56
board  = Board.new(loader.fen_array)

# Each player object created and assigned a player identity number.
# Players put in array for ease of iteration during the Chess game.
player_1 = Player.new(1)
player_2 = Player.new(2)
players  = [player_1, player_2]

board.print_board(current_location = nil)
players[0].get_active_pieces( board.player_1_pieces, board.player_2_pieces )
players[0].get_active_piece_locations(board)
players[0].navigate(board) do |current_location| 
  board.print_board(current_location)
end

