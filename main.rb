require 'pry-byebug'

# frozen_string_literal: true

require_relative './lib/player'
require_relative './lib/board'

ENTER = ['space', 'control_m']


player = Player.new('Player_1', 'red', [3, 3])
board  =  Board.new
#board.spaces[[1, 1]].visual

until false 
  location = player.move_space
#  print location.class
  board.change_current_loc_color(location)
  board.print_board
  puts
end
  
