# frozen_string_literal: true

require 'pry-byebug'
require_relative './lib/fen/load_fen'
require_relative './lib/game'
require_relative './lib/board'
require_relative './lib/instructions'
require_relative './lib/board'
require_relative './lib/space'
require_relative './lib/player'

loader = FenLoad.new('./lib/fen/saves/new_game.fen')
board  = Board.new(loader.fen_array)

player_1 = Player.new(1, board.player_1_pieces)
player_2 = Player.new(2, board.player_2_pieces)
players  = [player_1, player_2]
while true
  players.each do |player| 
    player.navigate(board) do |chosen_piece, previously_chosen_piece| 
      puts "chosen_piece: #{chosen_piece}"
      board.print_board(chosen_piece, previously_chosen_piece)
    end
  end
end

# while true
##  locations = player_1.choose_space
#  b.print_board(locations, player_1.identity)
#  locations = { curr: [3, 3], prev: [7, 7] }
#  b.print_board(locations, player_1.identity)
# end
