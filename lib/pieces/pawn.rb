# frozen_string_literal: true

require_relative 'piece'

class Pawn < Piece
  attr_accessor

  MOVES = {
    first_move_only:  [2, 2], after_first_move: [1, 1], 
      diag_take_left: [-1, 1], diag_take_right: [1, 1]
  }

  def initialize(player, location)
    super(player, location)
  end
end
  

