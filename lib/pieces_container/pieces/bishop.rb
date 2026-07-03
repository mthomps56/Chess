# frozen_string_literal: true

require_relative 'piece'
require_relative 'utf_codes'

class Bishop < Piece
  include ChessPieces
  attr_accessor :mv, :p

  MOVES = {
        up_left: [-1, 1],    up_right: [1, 1], 
      down_left: [-1, -1], down_right: [1, -1]
  }

  def initialize(player, location)
    super(player, location)
    @p  = player.eql?(1) ? ChessPieces::W_BISHOP : ChessPiece::B_BISHOP
    @mv = Bishop::MOVES
  end
end

