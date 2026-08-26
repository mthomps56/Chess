# frozen_string_literal: true

require 'pry-byebug'
require 'remedy'

include Remedy

class Player

  BOUNDS = { HIGH: 7, LOW: 0 }

  RIGHT = [1, 0]
  LEFT  = [-1, 0]
  DOWN  = [0, 1]
  UP    = [0, -1]

  attr_accessor :pieces, :curr_location, :prev_location, :user_input
  attr_reader   :identity

  def initialize(identity)
    @identity = identity    # The player number
    @pieces = {}
    @curr_location = identity.eql?(1) ? [1, 1] : [6, 6]
    @prev_location = prev_location

    @user_input = Interaction.new
  end

  def choose_space(bounds = false)
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

  def navigate(curr_location)
    user_input.loop do |key|
      key = key.to_s
      new_location = case key
        when 'a', 'left'
          [curr_location[0] +  LEFT[0], curr_location[1] + LEFT[1]]
        when 's', 'down'
          [curr_location[0] +  DOWN[0], curr_location[1] + DOWN[1]]
        when 'd', 'right'
          [curr_location[0] + RIGHT[0], curr_location[1] + RIGHT[1]]
        when 'w', 'up'
          [curr_location[0] +    UP[0], curr_location[1] +    UP[1]]
        when 'control_m', 'space'
          return new_location
        else
          puts "use [a] [s] [d] [w] or the arrow keys."
          next
        end
      return new_location
    end
  end

  def get_locations(piece_choices, new_location)
    piece_choices = piece_choices.map { |key, value| piece_choices[key] } 
    piece_locations = piece_choices.map { |indice, index| indice.location }
  end

  def get_active_pieces
    piece_choices = pieces.select { |name, piece| piece.active }
  end
  
  # Keeps the player cursor in bounds during piece selection.
  def in_bounds?(loc)       # loc is location
    valid_x = loc[0] <= BOUNDS[:HIGH] && loc[0] >= BOUNDS[:LOW] ? true : false
    valid_y = loc[1] <= BOUNDS[:HIGH] && loc[1] >= BOUNDS[:LOW] ? true : false
    valid_x && valid_y
  end

end



