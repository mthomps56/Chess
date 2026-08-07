# frozen_string_literal: true

# UNICODE CHESS PIECES AS CONSTANTS
module ChessPieces

  E = 'UTF-8'

  PIECES = {  
    # Player Yellow Pieces. Player(1)
    KING_1: 9818.chr(E).colorize(color: :light_yellow),
   QUEEN_1: 9819.chr(E).colorize(color: :light_yellow),
    ROOK_1: 9820.chr(E).colorize(color: :light_yellow),
  BISHOP_1: 9821.chr(E).colorize(color: :light_yellow),
  KNIGHT_1: 9822.chr(E).colorize(color: :light_yellow),
    PAWN_1: 9823.chr(E).colorize(color: :light_yellow),

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

