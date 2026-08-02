# frozen_string_literal: true
require_relative 'moves'
require_relative 'utf_codes'

class Piece

  include Moves
  include ChessPieces

  attr_accessor :type, :sym, :moves, :owner, :location, :active

  LOW, HIGH = 1, 8
  
  def initialize(type, location)
    @type = type 
    @sym = find_symbol(type)
    @moves = find_moves(type)
    @owner = find_owner(char)
    @location = location
    @active = true
  end

  def check_bounds(this_step, high, low)
    x_check = true if this_step.first >= LOW && this_step.first <= HIGH
    y_check = true if this_step.last  >= LOW && this_step.last  <= HIGH
    x_check && y_check 
  end

  def find_symbol(type)
    PIECES.each { |name, char| return char if name.end_with?(type.upcase) }
  end

  def find_moves(type)
    MOVES.each { |name, moves| return moves if name.eql?(type.upcase) }
  end

  def find_owner(char)
    char.eql?(char.upcase) ? 1 : 2
  end
    
end

