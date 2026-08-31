# frozen_string_literal: true

require_relative 'piece'
require_relative 'utf_codes'

class Knight < Piece
  include ChessPieces
  attr_accessor :mv, :v, :name, :owner

  MOVES = {
    left_up: [-2, 1], up_left:  [-1, 2],
    right_up: [2, 1], up_right: [1, 2],
    left_down: [-2, -1], down_left:  [-1, -2],
    right_down: [2, -1], down_right: [1, -2]
  }

  def initialize(player)
    super(player)
    @name = self.class.name
    @owner = player.eql?(1) ? 1 : 2
    @v  = player.eql?(1) ? ChessPieces::W_KNIGHT : ChessPieces::B_KNIGHT
    @mv = Knight::MOVES
  end
end
