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
  #game.check_bounds do
  location = player.move_space
  #  continue_flag = game.in_bounds?(location) ? true : false
  #  game.curr_loction = player.prev if !continue_flag
  #  puts "location: #{curr_location} && previous: #{player.prev_location}"
  #  continue_flag
  #end
  board.highlight_space(location, player.prev_location)   
  board.print_board
  puts
end
puts; puts;
puts "hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
puts
