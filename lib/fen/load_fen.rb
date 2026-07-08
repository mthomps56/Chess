# frozen_string_literal: true

class module

  def make_space_content(board, location)
    case board.spaces.symbol
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

    when nil  then count_consecutive_empty_spaces(board, location)
    end
  end

end

  
