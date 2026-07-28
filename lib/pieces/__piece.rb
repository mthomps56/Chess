# frozen_string_literal: true

require_relative 'utf_codes.rb'

class Piece
  include ChessPieces
  attr_accessor :player 

  def initialize(player)
    @player = player
  end
end


