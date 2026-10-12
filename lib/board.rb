# frozen_string_literal: true

require 'colorize'
require 'pry-byebug'
require_relative './space'

# Represents The chess board. Made of Space objects"
class Board
  BOARD_LENGTH = 7
  X_ROW = (0..7).to_a
  Y_COL = (0..7).to_a
  WHITE_SPACES_EVEN = [0, 2, 4, 6]
  WHITE_SPACES_ODD  = [1, 3, 5, 7]

  attr_accessor :spaces

  def initialize(save)
    @spaces = {}
    make_board(save)
  end

#-CHOOSING-PIECE----------------------------------------------------------------
  public
  # Ran inside a block that is called each time a piece is moved.              
  def print_board(current_location = nil)
    piece_at_locations = []
    highlight_piece(current_location)                                          
    Y_COL.each do |y|                                                          
      X_ROW.each do |x|                                                        
        spaces[[y, x]].print_space                                             
        yield(y, x) if block_given?
        puts if x.eql? BOARD_LENGTH                                            
      end                                                                      
    end                                                                        
    un_highlight_piece(current_location); puts; puts;                          
  end

  def highlight_piece(chosen_location)
    unless chosen_location.nil? # For the first iteration
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
    color = 
      spaces[current_location].piece.owner.eql?(1) ? :light_yellow : :blue#
    spaces[current_location].symbol =
      spaces[current_location].symbol.colorize(color: :blue)
    spaces[current_location].update_space
  end

#-CHOOSE-NEW-LOCATION-----------------------------------------------------------
  # This method is a mess. It shows the board, the potential spaces to move in
  # 'red', and the space symbol which is a piece symbol or a '*' to signify the
  # space is available to move to. 
  def print_board_with_move_options(legal_moves, cursor_location)
    # For storing which spaces the chosen piece can move to.
    highlighted_spaces = [] 

    Y_COL.each do |y|
      X_ROW.each do |x|
        if cursor_location.eql?([y, x])
          highlight_move(cursor_location, y, x) 
        elsif legal_moves.include? [y, x]
          spaces[[y, x]].change_symbol_to_show_potential_move # Give it the '*'
          highlighted_spaces << [y, x]    # Store the location array for later. 
        # The attributes need updated before printing. 
          spaces[[y, x]].update_space  
          spaces[[y, x]].print_space
        else
          spaces[[y, x]].print_space
        end
        puts if x.eql? BOARD_LENGTH  # Makes the board 8x8.
      end
    end
    highlighted_spaces
  end

  def highlight_move(cursor_location, y, x)
    if [y, x].eql?(cursor_location) 
      spaces[cursor_location].symbol = 
        spaces[cursor_location].symbol.colorize(color: :light_green)
      spaces[cursor_location].update_space
      spaces[cursor_location].print_space
    end
  end
  
  def un_highlight_moves_options(highlighted_spaces)
    highlighted_spaces.each do |coordinates| 
      spaces[coordinates].reset_symbol
      spaces[coordinates].update_space
    end
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
        distribute_piece_to_spaces(piece, color, y, x)
      end
    end
  end

  def distribute_piece_to_spaces(piece, color, x, y)
    spaces[[x, y]] = Space.new(color, piece) if piece.owner.eql?(1)
    spaces[[x, y]] = Space.new(color, piece) if piece.owner.eql?(2)
    spaces[[x, y]] = Space.new(color, piece) if piece.owner.eql?(0)
  end
#------------------------------------------------------------------------------
end
