# frozen_string_literal: true
require 'colorize'
require_relative 'space'

class Board
  X_ROW, Y_COL = (1..8).to_a, (1..8).to_a
  WHITE_SPACES_EVEN = [2, 4, 6, 8], GREY_SPACES_EVEN = [1, 3, 4, 6, 8]
#  WHITE_SPACES_ODD  = [1, 3, 5, 7], GREY_SPACES_EVEN = [2, 4, 6, 8]
  attr_accessor :spaces

  def initialize
    @spaces = {}
  end

  def make_board
    Y_COL.each do |x|
      white_space = y.even? ? WHITE_SPACE_EVEN : WHITE_SPACES_ODD
      X_ROW.each do |y|
        symbol = white_space.include?(x) ? :grey : :yellow
        spaces[[x, y]] = Space.new(symbol)
        spaces[[x, y]].print_space
      end
    end
  end
end

b = Board.new
