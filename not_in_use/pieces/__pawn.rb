# frozen_string_literal: true

require_relative 'piece'
require_relative 'utf_codes'

class Pawn < Piece
  include ChessPieces
  attr_accessor :mv, :v, :name, :owner

  MOVES = {
    first_move: [2, 0], move: [1, 0],
    take_left: [-1, 1], take_right: [1, 1]
  }

  def initialize(player)
    super(player)
    @name = self.class.name
    @owner = player.eql?(1) ? 1 : 2
    @v  = player.eql?(1) ? ChessPieces::W_PAWN : ChessPieces::B_PAWN
    @mv = Pawn::MOVES
  end
end
