# frozen_string_literal: true

require 'colorize'
require 'pry-byebug'
require_relative 'space'
require_relative 'pieces/pieces'
require_relative './fen/load_fen'

class Board

#  X_ROW, Y_COL = (1..8).to_a, (1..8).to_a
  X_ROW, Y_COL = (0..7).to_a, (0..7).to_a

#  WHITE_SPACES_EVEN = [2, 4, 6, 8] 
#  WHITE_SPACES_ODD  = [1, 3, 5, 7]
  WHITE_SPACES_EVEN = [0, 2, 4, 6] 
  WHITE_SPACES_ODD  = [1, 3, 5, 7]

  attr_accessor :spaces

  def initialize(save)
    @spaces = {}
    make_board(save)
    print_board
  end

  def make_board(save)  # 'save' arg is a fen string.
    Y_COL.each do |y|
      white_space = y.even? ? WHITE_SPACES_EVEN : WHITE_SPACES_ODD
      X_ROW.each do |x|
        char = save[y][x]
        color = white_space.include?(x) ? :grey : :white
#        binding.pry
#        piece = char.eql?('*') ? nil : Piece.new(char, [x, y])
        piece = Piece.new(char, [x, y])
        spaces[[x, y]] = Space.new(color, piece, piece.symbol)
      end
    end
  end

  def print_board
    Y_COL.each do |y|
      X_ROW.each do |x|
        spaces[[x, y]].print_space
        puts if x.eql? 7
      end
    end
  end

end

