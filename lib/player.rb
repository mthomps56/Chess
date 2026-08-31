# frozen_string_literal: true

require 'pry-byebug'
require 'remedy'
require 'colorize'

include Remedy

class Player

  BOUNDS = { HIGH: 7, LOW: 0 }
  RIGHT = [1, 0]; LEFT = [-1, 0]; DOWN = [0, 1]; UP = [0, -1]

  attr_accessor :curr_location, :prev_location, :user_input, :active_pieces, 
                :current_piece
  attr_reader   :identity

  def initialize(identity, player_pieces)
    @identity      = identity    # The player number
    @curr_location = identity.eql?(1) ? [1, 1] : [6, 6]
    @prev_location = prev_location
    @user_input    = Interaction.new
    @active_pieces = get_pieces_in_play(player_pieces)
    @current_piece = nil
  end

  def choose_space(choice = false, bounds = false)
    self.prev_location = curr_location
    new_location = navigate(curr_location)
    
    bounds = in_bounds?(new_location) ? true : false
    unless bounds
      self.curr_location = prev_location
      choose_space
    else
      self.prev_location = curr_location
      self.curr_location = new_location
    end
    puts "curr: #{curr_location}, prev: #{prev_location}"
    locations = { curr: curr_location, prev: prev_location }
  end

  def get_pieces_in_play(player_pieces)
    self.active_pieces = player_pieces.map do |key, piece| # Iterate through and
      piece.location if piece.active.eql?(true)            # take active pieces.
    end
  end

  def locate_piece(board, selected_location) # Takes in the current state of the
    space = board.spaces[selected_location]  # board and fetches piece at that
    current_piece = space.piece              # location.
  end

  def navigate(board)
    first_turn = true            # The first turn stars at middle most piece.
    current_piece_index = (active_pieces.length + 1) / 2 if first_turn # ^^^^
    user_input.loop do |key|     # Input loop takes key press.
      chosen_piece_location = case key.to_s # Changes piece location by index.
        when 'a', 'left'  then self.active_pieces[current_piece_index -= 1]
        when 's', 'down'  then self.active_pieces[current_piece_index += 1]
        when 'd', 'right' then self.active_pieces[current_piece_index += 1]
        when 'w', 'up'    then self.active_pieces[current_piece_index -= 1]
        else
          puts "use [a] [s] [d] [w] or the arrow keys"
          next
        end
      this_piece = locate_piece(board, chosen_piece_location)
      puts this_piece
      first_turn = false
    end
  end

  # Keeps the player cursor in bounds during piece selection.
  def in_bounds?(loc)       # loc is location
    valid_x = loc[0] <= BOUNDS[:HIGH] && loc[0] >= BOUNDS[:LOW] ? true : false
    valid_y = loc[1] <= BOUNDS[:HIGH] && loc[1] >= BOUNDS[:LOW] ? true : false
    valid_x && valid_y
  end
end

