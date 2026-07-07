# frozen_string_literal: true
require_relative '../pieces_container/pieces/pawn'
require_relative '../pieces_container/pieces/bishop'
require_relative '../pieces_container/pieces/knight'
require_relative '../pieces_container/pieces/rook'
require_relative '../pieces_container/pieces/queen'
require_relative '../pieces_container/pieces/queen'

# Module to create a Fen code from an in progress game that you wish to 
# return to at a later time.
module Create_Fen

  def get_space_contents(symbol, location)
    case symbol
    when 'P' then Pawn.new(1, [location]) # Player 1
    when 'p' then Pawn.new(2, [location]) # player 2

    when 'R' then Rook.new(1, [location]) # Player 1
    when 'r' then Rook.new(2, [location]) # Player 2

    when 'K' then King.new(1, [location]) # Player 1
    when 'k' then King.new(1, [location]) # Player 2

    when 'Q'  then Queen.new(1, [location]) # Player 1
    when 'q'  then Queen.new(1, [location]) # Player 2

    when 'B'  then Bishop.new(1, [location]) # Player 1
    when 'b'  then Bishop.new(2, [location]) # Player 2

    when 'KN' then Knight.new(1, [location]) # Player 1
    when 'kn' then Knight.new(2, [location]) # Player 2
    end
  end
end


