# frozen_string_literal: true
require 'pry-byebug'
require_relative './lib/fen/load_fen'
require_relative './lib/game'
require_relative './lib/board'
require_relative './lib/instructions'
require_relative './lib/board'
require_relative './lib/space'
require_relative './lib/player'

player_1 = Player.new(1)
player_2 = Player.new(2)
players = [player_1, player_2]

loader = FenLoad.new('./lib/fen/saves/new_game.fen') 
game = Game.new
b = Board.new(loader.fen_array)

active_pieces = player_1.get_in_play_pieces(b.player_1_pieces)
#while true
##  locations = player_1.choose_space
#  b.print_board(locations, player_1.identity)
#  locations = { curr: [3, 3], prev: [7, 7] }
#  b.print_board(locations, player_1.identity)
#end
