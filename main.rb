require 'pry-byebug'

# frozen_string_literal: true

require_relative './lib/player'
require_relative './lib/board'
require_relative './lib/game'

ENTER = ['space', 'control_m']


player = Player.new('Player_1', 'red', [3, 3])
board  = Board.new
game   = Game.new 

until false 
  player.move_space
  board.highlight_space(player.curr_location, player.prev_location)   
  board.print_board
end
