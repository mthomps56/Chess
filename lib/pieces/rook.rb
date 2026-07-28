# frozen_string_literal: true

require_relative 'pieces'
require_relative '../moves'

class Rook < Piece
  include Moves
  attr_accessor :moves

  def initialize
    @moves = ROOK
  end
end
