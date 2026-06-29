# frozen_string_literal: true

require_relative 'piece'

class Bishop < Piece
  attr_accessor

  BISHOP = {
        up_left: [-1, 1],    up_right: [1, 1], 
      down_left: [-1, -1], down_right: [1, -1]
  }

  def initialize(player, location)
    super(player, location)
  end

end

