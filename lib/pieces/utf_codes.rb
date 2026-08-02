# frozen_string_literal: true

# UNICODE CHESS PIECES AS CONSTANTS
module ChessPieces

  E = 'UTF-8'

  PIECES = {  
    # Player Red Pieces. Player(1)
    R_KING: 9812.chr(E).colorize(color: :red),
   R_QUEEN: 9813.chr(E).colorize(color: :red),
    R_ROOK: 9814.chr(E).colorize(color: :red),
  R_BISHOP: 9815.chr(E).colorize(color: :red),
  R_KNIGHT: 9816.chr(E).colorize(color: :red),
    R_PAWN: 9817.chr(E).colorize(color: :red),

    # Player Black Pieces. Player(2)
    B_KING: 9818.chr(E).colorize(color: :blue),
   B_QUEEN: 9819.chr(E).colorize(color: :blue),
    B_ROOK: 9820.chr(E).colorize(color: :blue),
  B_BISHOP: 9821.chr(E).colorize(color: :blue),
  B_KNIGHT: 9822.chr(E).colorize(color: :blue),
    B_PAWN: 9823.chr(E).colorize(color: :blue)
  }
end

