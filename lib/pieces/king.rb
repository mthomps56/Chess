# frozen_string_literal: true

require_relative 'piece'
require_relative 'utf_codes'

class King < Piece
  include ChessPieces
  attr_accessor :mv, :p

  MOVES = { 
      left_up: [-1, 1],    right_up: [1, 1],
    left_down: [-1, -1], right_down: [1, -1],
           up: [0, 1],         down: [0, -1]
  }

  def initialize(player)
    super(player)
    @p  = player.eql?(1) ? ChessPieces::W_KING : ChessPieces::B_KING
    @mv = King::MOVES
  end
end

