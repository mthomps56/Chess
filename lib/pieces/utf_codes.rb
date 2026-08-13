# frozen_string_literal: true

# UNICODE CHESS PIECES AS CONSTANTS
module ChessPieces

  E = 'UTF-8'

  PIECES = {  
    # Player Yellow Pieces. Player(1)
    king: 9818.chr(E).colorize(color: :light_yellow),
   queen: 9819.chr(E).colorize(color: :light_yellow),
    rook: 9820.chr(E).colorize(color: :light_yellow),
  bishop: 9821.chr(E).colorize(color: :light_yellow),
  knight: 9822.chr(E).colorize(color: :light_yellow),
    pawn: 9823.chr(E).colorize(color: :light_yellow),

    # Player Blue Pieces. Player(2)
    KING: 9818.chr(E).colorize(color: :blue),
   QUEEN: 9819.chr(E).colorize(color: :blue),
    ROOK: 9820.chr(E).colorize(color: :blue),
  BISHOP: 9821.chr(E).colorize(color: :blue),
  KNIGHT: 9822.chr(E).colorize(color: :blue),
    PAWN: 9823.chr(E).colorize(color: :blue),

    empty: ' '
  }
end

