# frozen_string_literal: true

require_relative 'piece'
require_relative 'utf_codes'

class Pawn < Piece
  include ChessPieces
  attr_accessor :mv, :p, :move_count, :check_rules

  MOVES = {
    first_move: [2, 0], move: [1, 0], 
      take_left: [-1, 1], take_right: [1, 1]
  }

  def initialize(player)
    super(player)
    @move_count = 0
    @p  = player.eql?(1) ? ChessPieces::W_PAWN : ChessPieces::B_PAWN
    @mv = Pawn::MOVES
    @check_rules = Proc.new { self.mv.delete(:first_move) if move_count > 0 }
  end
end

