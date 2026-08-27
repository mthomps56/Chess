# frozen_string_literal: true
require 'pry-byebug'
require_relative './lib/fen/load_fen'
require_relative './lib/game'
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

game = Game.new

loader = FenLoad.new('./lib/fen/saves/new_game.fen') 
b = Board.new(loader.fen_array)

p b.player_1_pieces.keys; puts;
p b.player_2_pieces.keys

while true
  locations = player_1.choose_space
  b.print_board(locations, player_1.identity)
#  locations = { curr: [3, 3], prev: [7, 7] }
#  b.print_board(locations, player_1.identity)
end
