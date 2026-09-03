# frozen_string_literal: true

require 'colorize'
require 'pry-byebug'
require_relative 'space'
require_relative 'pieces/pieces'
require_relative 'pieces/utf_codes'
require_relative './fen/load_fen'
require_relative './player'

class Board
  BOARD_LENGTH = 7
  X_ROW = (0..7).to_a
  Y_COL = (0..7).to_a
  WHITE_SPACES_EVEN = [0, 2, 4, 6]
  WHITE_SPACES_ODD  = [1, 3, 5, 7]

  attr_accessor :spaces, :player_1_pieces, :player_2_pieces, :pieces

  def initialize(save)
    @spaces = {}
    @pieces = {}            # pieces before being sorted by player
    @player_1_pieces = {}   # after sorting
    @player_2_pieces = {}   # ^^^^^^^^^^^^^
    make_board(save)
  end
  
  # Used in 'make_board'
  def do_player_piece_assignment(piece)
    collect_pieces(piece)
    sort_pieces
  end
  
  # Used in 'do_player_piece_assignment'
  def collect_pieces(piece)
    return if piece.type.eql?('EMPTY')

    count = pieces.keys.select { |key| key.include?(piece.type) }
    pieces[piece.type + '_' + count.length.to_s] = piece
  end
  # Used in 'do_player_piece_assignment'
  def sort_pieces
    pieces.each do |key, piece|
      if key.eql?(key.upcase)
        (player_1_pieces[key] = piece)
      else
        (player_2_pieces[key] = piece)
      end
    end
  end

  # Fill the board with spaces and each space with it's piece (or lack of)
  # based on the contents of the FEN data.
  def make_board(save) # 'save' arg is a fen string.
    Y_COL.each do |y|
      white_space = y.even? ? WHITE_SPACES_EVEN : WHITE_SPACES_ODD
      X_ROW.each do |x|
        char = save[y][x]
        color = white_space.include?(x) ? :grey : :white
        piece = Piece.new(char, [x, y])
        player = char.eql? char.upcase ? #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        spaces[[x, y]] = Space.new(color, piece)#, piece.symbol)
        do_player_piece_assignment(piece)
      end
    end
  end

  # Run after each player's turn.
  def print_board(chosen_piece, previously_chosen_piece)
    highlight_space(chosen_piece, previously_chosen_piece)
    Y_COL.each do |y|
      X_ROW.each do |x|
        spaces[[x, y]].print_space
        puts if x.eql? BOARD_LENGTH
      end
    end
  end

  # Used to highlight a piece when curser is over it.
  def highlight_space(chosen_piece, previously_chosen_piecer)
    chosen_piece.change_color_to_highlight            # Method of Piece
    puts chosen_piece.symbol
    spaces[chosen_piece.location].update_space(chosen_piece) # Method of Space
  end

  # Un-highlights cursor location when it moves.
  def un_highlight_space(previously_chosen_piece)
    previously_chosen_piece.symbol = ''
    spaces[chosen_piece.location].update_space(previously_chosen_piece)
  end
end
