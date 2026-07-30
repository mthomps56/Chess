# frozen_string_literal: true

# UNICODE CHESS PIECES AS CONSTANTS
module ChessPieces
  E = 'UTF-8'
  PIECES = {  
  # Player Red Pieces
    R_KING: 9812.chr(E),
   R_QUEEN: 9813.chr(E),
    R_ROOK: 9814.chr(E),
  R_BISHOP: 9815.chr(E),
  R_KNIGHT: 9816.chr(E),
    R_PAWN: 9817.chr(E),

  # Player Black Pieces
    B_KING: 9818.chr(E),
   B_QUEEN: 9819.chr(E),
    B_ROOK: 9820.chr(E),
  B_BISHOP: 9821.chr(E),
  B_KNIGHT: 9822.chr(E),
    B_PAWN: 9823.chr(E)
  }
end

