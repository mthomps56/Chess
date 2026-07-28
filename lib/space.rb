# frozen_string_literal: true
require_relative './pieces/utf_codes.rb'
#require_relative './pieces/


class Space
  include ChessPieces

  attr_accessor :piece, :color, :symbol

  def initialize(piece)
    @symbol = "  "
  end

  def print_space
    print symbol
  end
end
