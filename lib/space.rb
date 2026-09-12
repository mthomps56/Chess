#frozen_string_literal: true

require 'colorize'
require_relative './pieces/utf_codes'
require_relative './pieces/pieces'

class Space
  Y_COL = (0..7).to_a
  X_ROW = (0..7).to_a
  attr_accessor :piece, :color, :space

  def initialize(color, piece = nil)
    @piece = piece
#    @background = " #{piece.symbol} ".colorize(background: color)
    @color = color
    @space = " #{piece.symbol} ".colorize(background: color)
  end

  def print_space(x, y)
     print space
  end

  def update_space(piece)
    self.piece = piece
    #self.background = " #{piece.symbol} ".colorize(background: color)
  end

end
