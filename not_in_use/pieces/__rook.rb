# frozen_string_literal: true

require_relative 'piece'
require_relative 'utf_codes'

class Rook < Piece
  include ChessPieces
  attr_accessor :mv, :v, :name, :owner

  MOVES = {
    left: [-1, 0], right: [1, 0], up: [0, 1], down: [0, -1]
  }

  def initialize(player)
    super(player)
    @name = self.class.name
    @owner = player.eql?(1) ? 1 : 2
    @p = player.eql?(1) ? ChessPieces::W_ROOK : B_ROOK
    @mv = Rook::MOVES
  end
end

