require 'pry-byebug'

# frozen_string_literal: true

require_relative './lib/player'
require_relative './lib/board'

ENTER = ['space', 'control_m']


player = Player.new('Player_1', 'red', [3, 3])
board  =  Board.new

until false 
  location = player.move_space
  board.highlight_space(location, player.prev_location)
  board.print_board
  puts
end

