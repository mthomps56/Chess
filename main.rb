require 'pry-byebug'

# frozen_string_literal: true

require_relative './lib/player'
require_relative './lib/board'
require_relative './lib/game'
require_relative './lib/pieces_container/pieces/bishop'

ENTER = ['space', 'control_m']


player = Player.new('Player_1', 'red', [3, 3])
board  = Board.new
game   = Game.new 
bishop = Bishop.new(1, [3, 3])

#until false 
#  puts player.move_space
#  board.highlight_space(player.curr_location, player.prev_location)   
#  board.print_board
#  puts
#  player.valid_move?
#end

locations = board.show_piece_moves(bishop, bishop.location)
print locations

