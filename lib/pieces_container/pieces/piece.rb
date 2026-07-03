# frozen_string_literal: true

require_relative 'utf_codes.rb'

class Piece
  include ChessPieces
  attr_accessor :player, :location

  def initialize(player, location)
    @player = player
    @location = location
  end
  
  def move(dir, new_location)
  end
end


