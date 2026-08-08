# frozen_string_literal: true
require 'pry-byebug'
require_relative './lib/fen/load_fen'
require_relative './lib/board'
require_relative './lib/instructions'
require_relative './lib/board'
require_relative './lib/space'
require_relative './lib/player'

player_1 = Player.new(1)
loader = FenLoad.new('./lib/fen/saves/new_game.fen')
# loader.fen_array
b = Board.new(loader.fen_array)

start_of_turn = true
while true
  locations = player_1.move_space(start_of_turn)
  puts locations
  b.print_board(locations, player_1.identity)
  start_of_turn = false
end
