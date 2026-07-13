# frozen_string_literal: true

require_relative 'piece'
require_relative 'utf_codes'

class Bishop < Piece
  include ChessPieces
  attr_accessor :mv, :p, :name, :owner

  MOVES = {
        up_left: [-1, 1],    up_right: [1, 1], 
      down_left: [-1, -1], down_right: [1, -1]
  }

  def initialize(player)
    super(player)
    @name = self.class.name
    @owner = player.eql?(1) ? 1 : 2
    @v  = player.eql?(1) ? ChessPieces::W_BISHOP : ChessPieces::B_BISHOP
    @mv = Bishop::MOVES
  end
end

