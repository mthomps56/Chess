# frozen_string_literal: true

require 'pry-byebug'
require 'remedy'
require 'colorize'

include Remedy

# Player class chooses the piece based on the current number of active pieces.
class Player
  BOUNDS = { HIGH: 7, LOW: 0 }

  RIGHT = [1, 0]
  LEFT  = [-1, 0]
  DOWN  = [0, 1]
  UP    = [0, -1]

  attr_accessor :user_input, :active_pieces
  attr_reader   :identity

  def initialize(identity)
    @identity      = identity # The player number
    @user_input    = Interaction.new
    @active_pieces = nil
  end

  def navigate
    first_turn = true
    curr_piece_index = (active_pieces.length - 1) / 2 if first_turn
#    previous_location = active_pieces[curr_piece_index].location
    user_input.loop do |key|
      curr_piece_index = case key.to_s
                         when 'a', 'left'  then curr_piece_index -= 1
                         when 's', 'down'  then curr_piece_index += 1
                         when 'd', 'right' then curr_piece_index += 1
                         when 'w', 'up'    then curr_piece_index -= 1
                         when 'control_m', 'space'
                           current_location = active_pieces[curr_piece_index].location
                           return current_location
                         else
                           puts 'use [a] [s] [d] [w] or the arrow keys'
                           next
                         end
      current_location = active_pieces[curr_piece_index].location
      yield(current_location)#, previous_location)
      first_turn = false
      #      return current_location if players_piece_chosen.eql? true
    end
  end

# CHOOSING-LOCATION-TO-MOVE-TO--------------------------------------------------
  def move_navigate(index_size, available)
    current_index = (index_size - 1) / 2 
    user_input.loop do |key|
      current_index = case key.to_s
                       when 'a', 'left'  then current_index -= 1
                       when 's', 'down'  then current_index += 1
                       when 'd', 'right' then current_index += 1
                       when 'w', 'up'    then current_index -= 1
                       when 'control_m', 'space'
                         cursor_location = available[current_index]
                         return cursor_location
                       else
                         puts 'use [a] [s] [d] [w] or the arrow keys'
                         next
                       end
      cursor_location = available[current_index]  
      print cursor_location; puts;
      yield(available) if block_given?
    end
  end
  
  def process_possible_moves(chosen_location, spaces)
    moves = spaces[chosen_location].piece.get_iterative_moves(chosen_location)
    moves_flattened = spaces[chosen_location].piece.flatten_possible_moves(moves)
  end
#-------------------------------------------------------------------------------

  # Used in main to update @active_pieces player attribute. 
  def get_active_pieces(player_1_pieces, player_2_pieces)
    pieces = identity.eql?(1) ? player_1_pieces : player_2_pieces
    self.active_pieces = pieces.select { |piece| piece.active }
  end

end
