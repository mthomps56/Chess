# frozen_string_literal: true

require_relative 'piece'
require_relative 'utf_codes'

class Queen < Piece
  include ChessPieces
  attr_accessor :mv, :p

  MOVES = {
         left: [-1, 0],       right: [1, 0], 
      up_left: [-1, 1],    up_right: [1, 1], 
    down_left: [-1, -1], down_right: [1, -1],
           up: [0, 1],         down: [0, -1],
  }

  def initialize(player, location)
    super(player, location)
    @p  = player.eql?(1) ? ChessPieces::W_QUEEN : ChessPieces::B_QUEEN
    @mv = Queen::MOVES
  end
end

