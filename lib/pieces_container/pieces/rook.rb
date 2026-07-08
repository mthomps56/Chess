# frozen_string_literal: true

require_relative 'piece'
require_relative 'utf_codes'

class Rook < Piece
  include ChessPieces
  attr_accessor :mv, :p 

  MOVES = {
    left: [-1, 0], right: [1, 0], up: [0, 1], down: [0, -1]
  }

  def initialize(player, location)
    super(player, location)
    @p = player.eql?(1) ? ChessPieces::W_ROOK : B_ROOK
    @mv = Rook::MOVES
  end
end

