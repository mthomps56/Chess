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

  def reset_piece_location(new_location)
    self.piece.location = new_location
  end
  
  # Refresh spaces when reprinting the board.
  def update_space(color = self.color)
    self.space = " #{symbol} ".colorize(background: color)
  end
  
  # Used while navigating to a possible move.
  def change_symbol_to_show_potential_move
    self.symbol = self.available
  end

  def show_enemy_piece_to_kill
    self.symbol = 
      self.piece.symbol.colorize(color: :light_magenta) #if self.piece.owner != player.identity
  end

  # Move piece to new space and put 'EMPTY' piece in old space. 
  def take_new_piece_and_send_back_empty(prior_space, new_location)
    old_piece = assign_new_piece(prior_space, new_location)
    prior_space.assign_empty(old_piece, prior_space.piece.location)
  end

  def assign_new_piece(prior_space, new_location)
    old_piece = self.piece
    self.piece = prior_space.piece
    reset_symbol
    reset_piece_location(new_location)
    update_space
    return old_piece
  end

  # Is the old_space_empty? Usedd in assign empty.
  def old_piece_empty?
    return self.piece.type.eql? 'EMPTY' 
  end

  # Used in swap pieces. Assign an empty piece to the space a piece moved from.
  def assign_empty(piece, old_location)
    self.piece = old_piece_empty? ? piece : Piece.new('^', old_location)
    reset_symbol
    update_space
  end

end
