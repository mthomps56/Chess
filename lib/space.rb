# frozen_string_literal: true
require_relative './pieces/utf_codes.rb'
#require_relative './pieces/


class Space
  include ChessPieces

  attr_accessor :piece, :symbol

  def initialize(piece = nil, symbol = '  ')
    @symbol = symbol
    @piece = piece
  end

  def print_space
    print piece
  end

  def check_symbol(piece)
    unless piece.nil?
      self.symbol = " #{piece}"
    else
      self.symbol = '  '
    end
  end

end
