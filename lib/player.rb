# frozen_string_literal: true

require 'remedy'
include Remedy

class Player

  BOUNDS = { HIGH: 8, LOW: 1 }

  attr_accessor :name, :color, :curr_location, :prev_location, :user_input

  RIGHT = [1, 0]
  LEFT  = [-1, 0]
  DOWN  = [0, 1]
  UP    = [0, -1]

  # ENTER key is 'space' and 'control_m'

  def initialize(name = nil, color = nil, curr_location = [3, 3])
    @name = name
    @color = color
    @curr_location = curr_location
    @prev_location = curr_location
    @user_input = Interaction.new
  end

  def _move_space
    puts;
    print "curr_location: #{curr_location}"
    self.prev_location = curr_location 
    user_input.loop do |key|
      key = key.to_s
      self.curr_location = case key
      when 'a', 'left'
        [curr_location[0] +  LEFT[0], curr_location[1] +  LEFT[1]]
      when 's', 'down'
        [curr_location[0] +  DOWN[0], curr_location[1] +  DOWN[1]]
      when 'd', 'right'
        [curr_location[0] + RIGHT[0], curr_location[1] + RIGHT[1]]
      when 'w', 'up'
        [curr_location[0] +    UP[0], curr_location[1] +    UP[1]]
      else
        puts "USE [a] [s] [d] [w] or the arrow keys"
        next
      end
      next unless in_bounds?(curr_location)
      break
    end
  end

  def move_space(bounds = false)
    new_location = navigate
    bounds = in_bounds?(new_location) ? true : false
    puts bounds
    unless bounds
      curr_location =  prev_location
    else
      self.curr_location = new_location
    end
  end

  def navigate
    user_input.loop do |key|
      key = key.to_s
      new_location = case key
      when 'a', 'left'
        [curr_location[0] +  LEFT[0], curr_location[1] +  LEFT[1]]
      when 's', 'right'
        [curr_location[0] +  DOWN[0], curr_location[1] +  DOWN[1]]
      when 'd', 'right'
        [curr_location[0] + RIGHT[0], curr_location[1] + RIGHT[1]]
      when 'w', 'up'
        [curr_location[0] +    UP[0], curr_location[1] +    UP[1]]
      else 
        puts "USE [a] [s] [d] [w] or the ARROW keys."
        next
      end
      return new_location 
    end
  end

  def in_bounds?(loc)
    valid_x = loc[0] <= BOUNDS[:HIGH] && loc[0] >= BOUNDS[:LOW] ? true : false
    valid_y = loc[1] <= BOUNDS[:HIGH] && loc[1] >= BOUNDS[:LOW] ? true : false
    valid_x && valid_y ? (return true) : (return false)
  end

end
