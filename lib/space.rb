# frozen_string_literal: true

require 'colorize'
require_relative './pieces/utf_codes'
require_relative './pieces/pieces'

# Represents a single space of the chess board. Can hold a piece or
# be empty, represented by a 'EMPTY' dummy piece. Color the the space
# is determined by the 'make_board' Board method.
class Space
  Y_COL = (0..7).to_a
  X_ROW = (0..7).to_a
  attr_accessor :piece, :color, :space, :symbol, :available

  def initialize(color, piece = nil)
    @piece  = piece
    @symbol = piece.symbol
    @color  = color
    @space  = " #{symbol} ".colorize(background: color)
    @available = "*".colorize(color: :red)
  end

  def print_space
    print space
  end

  # Reset the symbol after a piece moves to and from the space.
  def reset_symbol
    self.symbol = piece.symbol
  end
  
  # Refresh spaces when reprinting the board.
  def update_space(color = self.color)
    self.space = " #{symbol} ".colorize(background: color)
  end
  
  # Used while navigating to a possible move.
  def change_symbol_to_show_potential_move
    self.symbol = self.available
  end

  def has_piece?
    return self.piece.type != "EMPTY" && self.piece.type != nil
  end

  def put_piece_here(piece)
    old_piece = self.piece
    self.piece = piece
    reset_symbol
    update_space
    old_piece
  end
  alias remove_piece put_piece_here

end
