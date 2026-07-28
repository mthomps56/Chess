# frozen_string_literal: true
require_relative 'moves'
class Piece
include Moves

  attr_accessor :type, :moves, :owner, :location, :active
  LOW, HIGH = 1, 8
  
  def initialize(type, owner, location)
    @type = type 
    @moves = find_moves(type)
    @owner = owner
    @location = location
    @active = true
  end

  def check_bounds(this_step, high, low)
    x_check = true if this_step.first >= LOW && this_step.first <= HIGH
    y_check = true if this_step.last  >= LOW && this_step.last  <= HIGH
    x_check && y_check 
  end
end

p = Piece.new('pawn', 1, [1, 1])
puts p.moves
