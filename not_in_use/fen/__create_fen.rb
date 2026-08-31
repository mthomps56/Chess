# frozen_string_literal: true

require_relative '../pieces_container/pieces/pawn'
require_relative '../pieces_container/pieces/bishop'
require_relative '../pieces_container/pieces/knight'
require_relative '../pieces_container/pieces/rook'
require_relative '../pieces_container/pieces/queen'
require_relative '../pieces_container/pieces/king'

# Module to create a Fen code from an in progress game that you wish to
# return to at a later time.
class Create_Fen
  attr_accessor

  def initialize
    @fen = ''
    @concecutive_spaces = 0
  end

  def make_fen_code(board)
    fen = ''
    x_axis = (1..8).to_a
    y_axis = (1..8).to_a
    y_axis.each do |y|
      x_axis.each do |x|
        if consecutive spaces > 1
          self.consecutive_spaces -= 1
          next
        end
        piece = board.spaces[x, y].piece.class
        space ? get_piece_class(piece) : count_consecutive_spaces

        fen += '/' if x.eql?(8)
      end
    end
    fen
  end

  def get_piece_class(space)
    case space
    when   Pawn.class.name then fen + board.spaces[x, y].p.eql?(1) ? 'P' : 'p'
    when   Rook.class.name then fen + board.spaces[x, y].p.eql?(1) ? 'R' : 'r'
    when   King.class.name then fen + board.spaces[x, y].p.eql?(1) ? 'K' : 'k'
    when Queen.class.name then fen + board.spaces[x, y].p.eql?(1) ? 'Q' : 'q'
    when Bishop.class.name then fen + board.spaces[x, y].p.eql?(1) ? 'B' : 'b'
    when Knight.class.name then fen + board.spaces[x, y].p.eql?(1) ? 'KN' : 'kn'
    else 'not found'
    end
  end

  def count_consecutive_spaces(board, _x_loc, y_axis)
    x_axis.each do |x|
      break unless board.spaces[x, y_axis].player.nil?

      self.consecutive_empty_spaces += 1
    end
    consecutive_empty_spaces
  end

  def save_game(_fen_string)
    File.new('./saves/date.txt')
  end
end
