require 'pry-byebug'

# frozen_string_literal: true

require_relative './lib/player'
require_relative './lib/board'
require_relative './lib/game'
require_relative './lib/pieces/bishop'
require_relative './lib/pieces/pawn'

ENTER = %w[space control_m]
player = Player.new
board  = Board.new
puts 'hey'
puts board.spaces[[1, 1]].class.name

until false
  puts player.move_space
  board.highlight_space(player.curr_location, player.prev_location)
  board.print_board
  puts
end
