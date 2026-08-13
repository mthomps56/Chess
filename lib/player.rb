# frozen_string_literal: true

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
    @curr_location = curr_location
    @prev_location = prev_location

    @user_input = Interaction.new
  end

  def move_space(start_of_turn = nil)

    self.curr_location = identity.eql?(1) ? [4, 1] : [4, 6] if start_of_turn
    self.prev_location = curr_location
    start_of_turn = false

    new_location = navigate(curr_location)
    bounds = in_bounds?(new_location) unless start_of_turn

    unless bounds
      self.curr_location = prev_location
      puts "from unless; curr: #{curr_location}, prev: #{prev_location}"
      move_space
    else
      self.prev_location = curr_location
      self.curr_location = new_location
      puts "from else; curr: #{curr_location}, prev: #{prev_location}"
    end
    return locations = { curr: curr_location, prev: prev_location }
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
        else
          puts "USE [a] [s] [d] [w] or the ARROW keys."
          return prev_location
        end
      return new_location
    end
  end
  
  # Keeps the player cursor in bounds during piece selection.
  def in_bounds?(loc)       # loc is location
    valid_x = loc[0] <= BOUNDS[:HIGH] && loc[0] >= BOUNDS[:LOW] ? true : false
    valid_y = loc[1] <= BOUNDS[:HIGH] && loc[1] >= BOUNDS[:LOW] ? true : false
    valid_x && valid_y
  end
end



