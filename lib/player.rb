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

  attr_accessor :user_input, :active_pieces, :chosen_piece_location, 
                :previous_piece_location, :current_piece
  attr_reader   :identity, :piece_color

  def initialize(identity, player_pieces)
    @identity      = identity # The player number
    @user_input    = Interaction.new
    @active_pieces = get_pieces_in_play(player_pieces)
    @piece_color   = identity.eql?(1) ? :blue : :yellow
#    @current_piece = nil
    @chosen_piece_location  = nil
    @previous_piece_location = nil
  end

  def choose_space(_choice = false, bounds = false)
    self.prev_location = curr_location
    new_location = navigate(curr_location)

    bounds = in_bounds?(new_location) || false
    if bounds
      self.prev_location = curr_location
      self.curr_location = new_location
    else
      self.curr_location = prev_location
      choose_space
    end
    puts "curr: #{curr_location}, prev: #{prev_location}"
    { curr: curr_location, prev: prev_location }
  end
  
  # Iterate through and take active pieces. '_key' not used. 
  def get_pieces_in_play(player_pieces)
    self.active_pieces = player_pieces.map do |_key, piece| 
      piece.location if piece.active.eql?(true) 
    end
  end
  
  # Takes in current state of the board and fetches piece at that location.
  def locate_piece(board, selected_location) 
    space = board.spaces[selected_location]  
    space.piece 
  end
  
  # The first turn starts at the middle most piece. 'input_loop' takes key 
  # press. Changes piece location by index. 
  def navigate(board, player_piece_chosen = false)
    first_turn = true 
    current_piece_index = (active_pieces.length + 1) / 2 if first_turn 
    user_input.loop do |key| 
      self.chosen_piece_location = case key.to_s 
         when 'a', 'left'  then active_pieces[current_piece_index -= 1]
         when 's', 'down'  then active_pieces[current_piece_index += 1]
         when 'd', 'right' then active_pieces[current_piece_index += 1]
         when 'w', 'up'    then active_pieces[current_piece_index -= 1]
         when 'control_m', 'space' then player_piece_chosen = true
         else
           puts 'use [a] [s] [d] [w] or the arrow keys' 
           next
         end
      self.previous_piece_location = chosen_piece_location
      pp chosen_piece_location
      chosen_piece = locate_piece(board, chosen_piece_location)
      previously_chosen_piece = chosen_piece
      first_turn = false
      yield(chosen_piece, previously_chosen_piece)
      break if player_piece_chosen.eql? true
    end
  end

  # Keeps the player cursor in bounds during piece selection.
  def in_bounds?(loc) # loc is location
    valid_x = loc[0] <= BOUNDS[:HIGH] && loc[0] >= BOUNDS[:LOW] ? true : false
    valid_y = loc[1] <= BOUNDS[:HIGH] && loc[1] >= BOUNDS[:LOW] ? true : false
    valid_x && valid_y
  end
end
