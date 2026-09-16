# frozen_string_literal: true

require 'colorize'
require 'pry-byebug'
require_relative './space'
require_relative 'pieces/pieces'
require_relative 'pieces/utf_codes'
require_relative './fen/load_fen'
require_relative './player'

#LINE 8
class Board
  BOARD_LENGTH = 7
  X_ROW = (0..7).to_a
  Y_COL = (0..7).to_a
  WHITE_SPACES_EVEN = [0, 2, 4, 6]
  WHITE_SPACES_ODD  = [1, 3, 5, 7]

  attr_accessor :spaces, :player_1_pieces, :player_2_pieces 

  def initialize(save)
    @spaces = {}
    @player_1_pieces = []  # Use when picking a piece while using navigate.  
    @player_2_pieces = []   
    make_board(save)
  end
  
  public
 
  # Ran inside a block that is called each time a piece is moved.
  def print_board(current_location = nil , previous_location = nil)
    highlight_piece(current_location, previous_location)
    puts; puts;
    Y_COL.each do |y|
      X_ROW.each do |x|
        spaces[[y, x]].print_space
        puts if x.eql? BOARD_LENGTH
      end
    end
  end

  def highlight_piece(chosen_location, previous_location)
    unless chosen_location.nil?
      spaces[chosen_location].symbol = 
        spaces[chosen_location].symbol.colorize(color: :light_green)
      print "#{spaces[chosen_location].symbol}: #{spaces[chosen_location].piece.type}"
      print "#{chosen_location}"
    end
    puts; puts;
  end

  # Un-highlights cursor location when it moves.
  def un_highlight_space(previous_piece)
    if previous_piece.owner.eql?(1)
      previous_piece.colorize(color: :blue) 
    elsif previous_piece.owner.eql?(2)
      previous_piece.colorize(color: :light_yellow)
    end
  end

  private
  
  # LINE 56
  # Fill the board with spaces and each space with it's piece (or lack of)
  # based on the contents of the FEN data.
  def make_board(save) # 'save' arg is a fen string.
    Y_COL.each do |y|
      white_space = y.even? ? WHITE_SPACES_EVEN : WHITE_SPACES_ODD
      X_ROW.each do |x|
        char = save[y][x]
        color = white_space.include?(x) ? :grey : :white
        piece = Piece.new(char, [y, x])
        send_created_piece_to_players_array(piece)
        distribute_piece_to_spaces(piece, color, y, x)
      end
    end  
  end

  def send_created_piece_to_players_array(piece)
    return if piece.type.eql? ('EMPTY')
    if piece.type.eql? (piece.type.upcase)
      self.player_1_pieces << piece
    elsif piece.type.eql? (piece.type)
      self.player_2_pieces << piece 
    end
  end
 
  def distribute_piece_to_spaces(piece, color, x, y)
    self.spaces[[x, y]] = Space.new(color, piece) if piece.owner.eql?(1)
    self.spaces[[x, y]] = Space.new(color, piece) if piece.owner.eql?(2)  
  end
end
