# frozen_string_literal: true

# UNICODE CHESS PIECES AS CONSTANTS
module ChessPieces

  E = 'UTF-8'

  PIECES = {  
    # Player Red Pieces. Player(1)
    KING_1: 9812.chr(E).colorize(color: :red),
   QUEEN_1: 9813.chr(E).colorize(color: :red),
    ROOK_1: 9814.chr(E).colorize(color: :red),
  BISHOP_1: 9815.chr(E).colorize(color: :red),
  KNIGHT_1: 9816.chr(E).colorize(color: :red),
    PAWN_1: 9817.chr(E).colorize(color: :red),

    # Player Blue Pieces. Player(2)
    KING_2: 9818.chr(E).colorize(color: :blue),
   QUEEN_2: 9819.chr(E).colorize(color: :blue),
    ROOK_2: 9820.chr(E).colorize(color: :blue),
  BISHOP_2: 9821.chr(E).colorize(color: :blue),
  KNIGHT_2: 9822.chr(E).colorize(color: :blue),
    PAWN_2: 9823.chr(E).colorize(color: :blue),

    EMPTY: ' '
  }
end

