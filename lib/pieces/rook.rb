# frozen_string_literal: true

require_relative 'piece'

class Rook < Piece
  attr_accessor

  ROOK = {
    left: [-1, 0], right: [1, 0], up: [0, 1], down: [0, -1]
  }

  def initialize(player, location)
    super(player, location)
  end
end
  
