# frozen_string_literal: true

require 'remedy'
include Remedy

class Player
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

  def move_space
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
#      return curr_location
      break
    end
  end

end
