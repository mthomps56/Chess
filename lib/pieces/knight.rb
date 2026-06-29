# frozen_string_literal: true

require_relative 'piece'

class Knight < Piece
  attr_accessor 

  KNIGHT = {
       left_up: [-2, 1],    up_left:  [-1, 2], 
      right_up: [2, 1],     up_right: [1, 2],
     left_down: [-2, -1], down_left:  [-1, -2], 
    right_down: [2, -1],  down_right: [1, -2]
  }

  def initialize(player, location)
    super(player, location)
  end
end

