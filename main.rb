# froizen_string_literal: true

require_relative './lib/instructions'
require_relative './lib/fen/load_fen'
require_relative './lib/board'
require_relative './lib/player'

include Messages
# Contains fen_string which holds piece location of new or prev games.
loader = FenLoad.new('./lib/fen/saves/new_game.fen')

board  = Board.new(loader.fen_array)

player_1 = Player.new(1)
player_2 = Player.new(2)
players  = [player_1, player_2]

while true
  # Show board setup and update 'active_pieces' array. 
  board.print_board do |y, x| 
    players[0].get_active_pieces(board.spaces[[y, x]].piece)
  end

  # Choose a piece to move.
  origin_location = players[0].navigate do |current_location|
    board.print_board(current_location)
  end
 #------------------------------------------------------------------------------ 
  # Get the board with the chosen piece's possible movement locations shown.
  legal_spaces = players[0].process_possible_moves(board.spaces, origin_location)
  index_size = legal_spaces.length
  board.print_board_with_move_options(legal_spaces, origin_location)

  # Choose a legal location for piece to move to.
  new_location = 
    players[0].move_navigate(index_size, legal_spaces) do 
      |legal_spaces, cursor_location|
      board.print_board_with_move_options(legal_spaces, cursor_location)
  end
  board.un_highlight_moves_options(legal_spaces)
#-------------------------------------------------------------------------------
  # Piece movement.
  board.spaces[new_location].take_new_piece_and_send_back_empty(
    board.spaces[origin_location], new_location)
#  empty_piece_for_original_space = 
#    board.spaces[new_location].put_piece_here(board.spaces[origin_location].piece)
#  board.spaces[new_location].piece.location = new_location
#  board.spaces[origin_location].put_empty_piece(empty_piece_for_original_space)
end
