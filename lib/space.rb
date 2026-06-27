# frozen_string_literal: true

require 'colorize'

class Space
  attr_accessor :color, :player, :piece, :visual

  def initialize(color = nil, player = nil, piece = nil, visual: '[  ]')
    @player = player
    @piece  = piece
    @color = color
    @visual = visual
  end

  def take_space(player)
    self.player = player.name
    self.piece  = player.piece
    self.color  = player.color
  end
end
