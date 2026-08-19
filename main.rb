# frozen_string_literal: true
require 'pry-byebug'
require_relative './lib/fen/load_fen'
require_relative './lib/board'
require_relative './lib/instructions'
require_relative './lib/board'
require_relative './lib/space'
require_relative './lib/player'
require_relative './lib/game_procs'

include GameProcs

player_1 = Player.new(1)
player_2 = Player.new(2)
players = [player_1, player_2]

loader = FenLoad.new('./lib/fen/saves/new_game.fen') 
b = Board.new(loader.fen_array)

player_pieces = GameProcs::GET_PLAYER_PIECES.call(b.pieces)
player_1.pieces, player_2.pieces = player_pieces[0], player_pieces[1]
players = [player_1, player_2]
player_piece_choices = players[0].get_active_pieces
active_piece_locations = players[0].get_locations(player_piece_choices, [6, 7])

# Single piece expended move set
player_1.pieces['ROOK_1'].calculate_possible_coordinates(active_piece_locations[0])

selection = false
start_of_turn = true
while true
  locations, selection = player_1.move_space
  b.print_board(locations, player_1.identity)
end
