# frozen_string_literal: true

# Holds the allowed moves for every piece on the chess board. Upon 
# an instantiation of the 'Piece' class that pieces move set is loaded
# in to the @moves attribute.

module Moves

MOVES = { 
  'ROOK' => {
    left: [-1, 0], right: [1, 0], up: [0, 1], down: [0, -1]
  },

  'BISHOP' => {
      up_left: [-1, 1],    up_right: [1, 1], 
    down_left: [-1, -1], down_right: [1, -1]
  },

  'QUEEN' => {
         left: [-1, 0],       right: [1, 0], 
      up_left: [-1, 1],    up_right: [1, 1], 
    down_left: [-1, -1], down_right: [1, -1],
           up: [0, 1],         down: [0, -1]
  }, 

  'KNIGHT' => {
       left_up: [-2, 1],    up_left:  [-1, 2], 
      right_up: [2, 1],     up_right: [1, 2],
     left_down: [-2, -1], down_left:  [-1, -2], 
    right_down: [2, -1],  down_right: [1, -2]
  }, 

  'KING' => { 
      left_up: [-1, 1],    right_up: [1, 1],
    left_down: [-1, -1], right_down: [1, -1],
           up: [0, 1],         down: [0, -1]
  }, 

  'PAWN' => {
    first_move_only:  [2, 2], after_first_move: [1, 1], 
      diag_take_left: [-1, 1], diag_take_right: [1, 1]
  }
}  
end

#  def find_moves(type)
#    MOVES.each { |name, moves| return moves if name.eql?(type.upcase) }
#  end

