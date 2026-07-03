# frozen_string_literal: true

require_relative 'piece'
require_relative 'utf_codes'

class Pawn < Piece
  include ChessPieces
  attr_accessor :mv, :p

  MOVES = {
    first_move_only:  [2, 0], after_first_move: [1, 0], 
      diag_take_left: [-1, 1], diag_take_right: [1, 1]
  }

  def initialize(player, location)
    super(player, location)
    @p  = player.eql?(1) ? ChessPieces::W_PAWN : ChessPieces::B_PAWN
    @mv = Pawn::MOVES
  end
end

#pawn = Pawn.new(1 , [3, 8])
#print pawn.p
#pawn.mv.each_value { |dir| print dir }

