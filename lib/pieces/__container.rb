# frozen_string_literal: true

require './pieces/pawn'
require './pieces/rook'
require './pieces/bishop'
require './pieces/knight'
require './pieces/queen'
require './pieces/king'

class Pieces

  def initialize
    @pawn   = Array(8) { Pawn.new(player, location) }

    @rook   = { l: Rook.new, r: Rook.new(player, location) }
    @bishop = { l: Bishop.new, r: Bishop.new(player, location) }
    @knight = { l: Knight.new, r: Knight.new(player, location) }

    @queen  = Queen.new(player, location)
    @king   = King.new(player, location)
  end

end
