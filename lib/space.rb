# frozen_string_literal: true
require 'colorize'
require_relative './pieces/utf_codes.rb'
require_relative './pieces/pieces'

class Space
  include ChessPieces

  attr_accessor :background, :color, :piece, :symbol

  def initialize(color, piece, symbol = '')
    @piece = piece
    @symbol = symbol 
    @background = "#{symbol} ".colorize(background: color)
    @color = color
  end

  def update_space(piece)
    @piece = piece
    @symbol = piece.symbol
    @background = "#{symbol} ".colorize(background: color)
  end

  def print_space
    print background 
  end

end
