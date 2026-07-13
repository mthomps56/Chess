# frozen_string_literal: true

require 'colorize'

# The Space class will represent each space on the chess board. 
class Space
  attr_accessor :color, :player, :piece, :visual

  def initialize(player = nil, piece = nil, visual: " #{piece.p} ")
    @player = player
    @piece  = piece
    @visual = visual

    # This is the defualt color for the space. When it's not highlighted 
    # this attribute is used to change visual back to it's default.
    @color = visual
  end

  def take_space(piece)
    self.player = piece.owner
    self.piece  = piece.class.name 
    self.visual = " #{piece.v}".colorize(background: background)
  end
end
