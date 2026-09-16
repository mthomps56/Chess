#frozen_string_literal: true

require 'colorize'
require_relative './pieces/utf_codes'
require_relative './pieces/pieces'

class Space
  Y_COL = (0..7).to_a
  X_ROW = (0..7).to_a
  attr_accessor :piece, :color, :space, :symbol

  def initialize(color, piece = nil)
    @piece  = piece
    @symbol = piece.symbol
    @color  = color
    @space  = " #{symbol} ".colorize(background: color)
  end

  def print_space
     print space
  end
end
