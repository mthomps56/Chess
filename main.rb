# frozen_string_literal: true

require 'pry-byebug'
require_relative './lib/instructions'
require_relative './lib/fen/load_fen'
require_relative './lib/board'
require_relative './lib/space'
require_relative './lib/player'

include Messages
puts Messages::INSTRUCTIONS # HOW TO PLAY

# Contains fen_string which holds piece location of new or prev games.
loader = FenLoad.new('./lib/fen/saves/new_game.fen')

# Board calls 'make_board' which fills individual pieces to oppropriate
# individual spaces that make up the board.

# make_board is board.rb
board  = Board.new(loader.fen_array)

# Each player object created and assigned a player identity number.
# Players put in array for ease of iteration during the Chess game.
player_1 = Player.new(1)
player_2 = Player.new(2)
players  = [player_1, player_2]

board.print_board(nil)
players[0].get_active_pieces(board.player_1_pieces, board.player_2_pieces)
chosen_location = players[0].navigate do |current_location|
  board.print_board(current_location)
end

players[0].choose_space_to_move_to(chosen_location, board.spaces)
#move_directions = board.spaces[chosen_location].piece.get_movement_directions
#print "movement_directions: #{move_directions}"; puts;

#locations = board.spaces[chosen_location].piece.get_initial_moves(move_directions, chosen_location)
#print "locations: #{locations}"; puts;

#possible_locations = board.spaces[chosen_location].piece.find_legal_moves(locations)
#print "possible_locations: #{possible_locations}"; puts;

#x = board.spaces[chosen_location].piece.get_iterative_moves(chosen_location)
#print x

#direction = board.spaces[chosen_location].piece.take_step(chosen_location, [-1, 1], direction = [])
#print "recursive #{direction}"
#print board.spaces[chosen_location].piece.get_legal_moves(movement_directions, 
#                                                           chosen_location)

#pp board.spaces[chosen_location].piece.iterable; puts;
#board.spaces[chosen_location].piece.get_legal_iterative_moves

