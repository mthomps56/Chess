# frozen_string_literal: true

class Piece
  attr_accessor :player, :location

  def initialize(player, location)
    @player = player
    @location = location
  end
  
  def move(dir, new_location)
  end
end


