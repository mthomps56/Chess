# frozen_string_literal: true

require_relative 'piece'

class King < Piece
  attr_accessor

  KING = { 
      left_up: [-1, 1],    right_up: [1, 1],
    left_down: [-1, -1], right_down: [1, -1],
           up: [0, 1],         down: [0, -1]
  }

  def initialize(player, location)
    super(player, location)
  end
end

