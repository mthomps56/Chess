# frozen_string_literal: true

require_relative 'piece'

class Queen < Piece
  attr_accessor

  QUEEN = {
         left: [-1, 0],       right: [1, 0], 
      up_left: [-1, 1],    up_right: [1, 1], 
    down_left: [-1, -1], down_right: [1, -1],
           up: [0, 1],         down: [0, -1],
  }

  def initialize(player, location)
    super(player, location)
  end
end
  
