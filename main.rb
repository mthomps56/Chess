require 'pry-byebug'

# frozen_string_literal: true

require_relative './lib/player'
require_relative './lib/board'
require_relative './lib/game'
require_relative './lib/pieces/bishop'
require_relative './lib/pieces/pawn'

ENTER = ['space', 'control_m']


player = Player.new('Player_1', 'red', [3, 3])
game   = Game.new

fen_string = game.initiate_choice('./lib/fen/saves/new_game.fen').chomp
board  = Board.new(fen_string, game.start_game.load)

until false 
  puts player.move_space
  board.highlight_space(player.curr_location, player.prev_location)   
  board.print_board
  puts
end

