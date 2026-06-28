# frozen_string_literal: true

# This module contains the opening instructions for how to play
# as well as legal moves for each of the six different chess
# pieces. They are used for navigation as well as checks for
# legality. 

# The arrays represnt x and y coordinate movements on the chess board.

module Interface

# [x, y]

  ROOK = {
    left: [-1, 0], right: [1, 0], up: [0, 1], down: [0, -1]
  }

  BISHOP = {
      up_left: [-1, 1],    up_right: [1, 1], 
    down_left: [-1, -1], down_right: [1, -1]
  }

  QUEEN = {
         left: [-1, 0],       right: [1, 0], 
      up_left: [-1, 1],    up_right: [1, 1], 
    down_left: [-1, -1], down_right: [1, -1],
           up: [0, 1],         down: [0, -1],
  }

  KNIGHT = {
       left_up: [-2, 1],    up_left:  [-1, 2], 
      right_up: [2, 1],     up_right: [1, 2],
     left_down: [-2, -1], down_left:  [-1, -2], 
    right_down: [2, -1],  down_right: [1, -2]
  }

  KING = { 
      left_up: [-1, 1],    right_up: [1, 1],
    left_down: [-1, -1], right_down: [1, -1],
           up: [0, 1],         down: [0, -1]
  }

  PAWN = {
    first_move_only:  [2, 2], after_first_move: [1, 1], 
      diag_take_left: [-1, 1], diag_take_right: [1, 1]
  }

  INTRUCTIONS = <<~HEREDOC

    Welcome to CHESS. To begin a new game press [1].
    To continue the last game press [2]

    During Game:

    Use   [w]    or       [Up]  
       [a][s][d]    [Left Down Right] arrows to highlight a piece to move.

    CONFIRM piece by hitting [ENTER] or [SPACE].

    Possible moves available will be highlighted. Choose space to move to.

    Hit [ENTER] or [SPACE] to move piece. Player 2 repeats this process.

    GL HF


  HEREDOC
  
end


 
