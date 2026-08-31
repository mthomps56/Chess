# frozen_string_literal: true

require 'colorize'

# The Space class will represent each space on the chess board.
class Space
  attr_accessor :color, :piece, :visual, :background, :content

  def initialize
    @piece  = piece
    @visual = visual
    # This is the defualt color for the space. When it's not highlighted
    # this attribute is used to change visual back to it's default.
    @color = visual
    @content = " #{piece}".colorize(background: background)
  end

  def take_space(piece); end
end

space = Space.new(piece)
print space.content
