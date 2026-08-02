# frozen_string_literal: true
require_relative './pieces/utf_codes.rb'
require_relative './pieces/pieces'

class Space
  include ChessPieces

  attr_accessor :piece, :symbol

  def initialize(piece = nil, symbol = '  ')
#    @symbol = check_symbol(fen)
    @piece = piece
  end

  def print_space
    print piece
  end

  def check_piece  #symbol(piece)
    unless piece.nil?
      self.piece = " #{piece}"  #.sym}"
    else
      self.piece = "  "         #symbol = '  '
    end
  end
        
end
