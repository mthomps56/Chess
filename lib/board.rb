# frozen_string_literal: true
require 'colorize'
require_relative 'space'

class Board
  X_ROW, Y_COL = (1..8).to_a, (1..8).to_a
  WHITE_SPACES_EVEN = [2, 4, 6, 8] #, GREY_SPACES_EVEN = [1, 3, 4, 6, 8]
  WHITE_SPACES_ODD  = [1, 3, 5, 7] #, GREY_SPACES_EVEN = [2, 4, 6, 8]
  attr_accessor :spaces

  def initialize
    @spaces = {}
    make_board
    print_board
  end

  def make_board(fen)
    Y_COL.each do |y|
      white_space = y.even? ? WHITE_SPACES_EVEN : WHITE_SPACES_ODD
      X_ROW.each do |x|
        color = white_space.include?(x) ? :grey : :white
        spaces[[x, y]] = Space.new("  ".colorize(background: color))
      end
    end
  end

  def print_board
    Y_COL.each do |y|
      X_ROW.each do |x|
        spaces[[x, y]].print_space
        puts if x.eql? 8
      end
    end
  end

end

b = Board.new
