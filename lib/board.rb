# frozen_string_literal: true

require 'colorize'
require 'pry-byebug'
require_relative './space'
require_relative 'pieces/pieces'
require_relative 'pieces/utf_codes'
require_relative './fen/load_fen'
require_relative './player'

# Represents The chess board. Made of Space objects"
class Board
  BOARD_LENGTH = 7
  X_ROW = (0..7).to_a
  Y_COL = (0..7).to_a
  WHITE_SPACES_EVEN = [0, 2, 4, 6]
  WHITE_SPACES_ODD  = [1, 3, 5, 7]

  attr_accessor :spaces, :player_1_pieces, :player_2_pieces

  def initialize(save)
    @spaces = {}
    @player_1_pieces = [] # Use when picking a piece while using navigate.
    @player_2_pieces = []
    make_board(save)
  end
  def show_piece_info
    Y_COL.each do |y|
      X_ROW.each do |x|
        puts "type:\n     #{spaces[[y, x]].piece.type}"; puts;
        puts "owner:\n    #{spaces[[y, x]].piece.owner}"; puts;
        puts "moves:\n    #{spaces[[y, x]].piece.moves}"; puts;
      end
    end
  end

#-CHOOSING-PIECE----------------------------------------------------------------
  public
  # Ran inside a block that is called each time a piece is moved.              
  def print_board(current_location = nil)                                      
    highlight_piece(current_location)                                          
    Y_COL.each do |y|                                                          
      X_ROW.each do |x|                                                        
        spaces[[y, x]].print_space                                             
        puts if x.eql? BOARD_LENGTH                                            
      end                                                                      
    end                                                                        
    un_highlight_piece(current_location); puts; puts;                          
  end

  private
  def highlight_piece(chosen_location)
    unless chosen_location.nil?
      spaces[chosen_location].symbol =
        spaces[chosen_location].symbol.colorize(color: :light_green)
      spaces[chosen_location].update_space
      print "#{spaces[chosen_location].symbol}: #{spaces[chosen_location].piece.type}"
      print "#{chosen_location}"
    end
    puts
  end

  # Un-highlights cursor location when it moves.
  def un_highlight_piece(current_location)
    return if current_location.nil?
    color = #
      spaces[current_location].piece.owner.eql?(1) ? :light_yellow : :blue#
    spaces[current_location].symbol =
      spaces[current_location].symbol.colorize(color: :blue)
    spaces[current_location].update_space
  end

#-CHOOSE-NEW-LOCATION-----------------------------------------------------------
  public
  def print_board_with_move_options(legal_moves)
    possible_move_color = :red
    Y_COL.each do |y|
      X_ROW.each do |x|
        if legal_moves.include? [y, x]
          spaces[[y, x]].change_symbol_to_show_potential_move
          spaces[[y, x]].update_space
          spaces[[y, x]].print_space
        else
          spaces[[y, x]].print_space
        end
        puts if x.eql? BOARD_LENGTH
      end
    end
  end

  private
  # Once the possible moves for the chosen piece are found, show them with the
  # '*' character in the possible spaces.
  def highlight_available_moves(cursor_location)
    print "#{cursor_location}"; puts;
#    spaces[cursor_location].available = " * ".colorize(color: :light_green)
  end

#-------------------------------------------------------------------------------
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
    return if piece.type.eql?('EMPTY')

    if piece.type.eql?(piece.type.upcase)
      player_1_pieces << piece
    elsif piece.type.eql?(piece.type)
      player_2_pieces << piece
    end
  end

  def distribute_piece_to_spaces(piece, color, x, y)
    spaces[[x, y]] = Space.new(color, piece) if piece.owner.eql?(1)
    spaces[[x, y]] = Space.new(color, piece) if piece.owner.eql?(2)
  end
#------------------------------------------------------------------------------
end
