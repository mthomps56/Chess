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
    x_axis, y_axis = (1..8).to_a, (1..8).to_a
    y_axis.each do |y|
      x_axis.each do |x|
        if self.consecutive spaces > 1
          self.consecutive_spaces -= 1
          next
        end
        piece = board.spaces[x, y].piece.class
        tmp = space ? get_piece_class(piece) : count_consecutive_spaces
        
         fen = fen + '/' if x.eql?(8) 
      end
    end
    fen
  end

  def get_piece_class(space)
    fen = case space
    when   Pawn.class.name then fen + board.spaces[x, y].p.eql?(1) ? 'P' : 'p'
    when   Rook.class.name then fen + board.spaces[x, y].p.eql?(1) ? 'R' : 'r'
    when   King.class.name then fen + board.spaces[x, y].p.eql?(1) ? 'K' : 'k'
    when  Queen.class.name then fen + board.spaces[x, y].p.eql?(1) ? 'Q' : 'q'
    when Bishop.class.name then fen + board.spaces[x, y].p.eql?(1) ? 'B' : 'b'
    when Knight.class.name then fen + board.spaces[x, y].p.eql?(1) ? 'KN' : 'kn'
    else "not found"
    end
    fen
  end

 
  def count_consecutive_spaces(board, x_loc, y_axis)
    x_axis.each do |x| 
      board.spaces[x, y_axis].player.nil? ? self.consecutive_empty_spaces += 1 
                                          : break
    end
    total_count = self.consecutive_empty_spaces
  end

  def save_game(fen_string)
    file = File.new('./saves/date.txt')
  end
end


