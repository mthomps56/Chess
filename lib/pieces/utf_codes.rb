# frozen_string_literal: true

# UNICODE CHESS PIECES AS CONSTANTS
module ChessPieces

  E = 'UTF-8'

  PIECES = {  
    # Player Red Pieces. Player(1)
    KING_R: 9812.chr(E).colorize(color: :red),
   QUEEN_R: 9813.chr(E).colorize(color: :red),
    ROOK_R: 9814.chr(E).colorize(color: :red),
  BISHOP_R: 9815.chr(E).colorize(color: :red),
  KNIGHT_R: 9816.chr(E).colorize(color: :red),
    PAWN_R: 9817.chr(E).colorize(color: :red),

    # Player Blue Pieces. Player(2)
    KING_B: 9818.chr(E).colorize(color: :blue),
   QUEEN_B: 9819.chr(E).colorize(color: :blue),
    ROOK_B: 9820.chr(E).colorize(color: :blue),
  BISHOP_B: 9821.chr(E).colorize(color: :blue),
  KNIGHT_B: 9822.chr(E).colorize(color: :blue),
    PAWN_B: 9823.chr(E).colorize(color: :blue),

    EMPTY: ' '
  }
end

