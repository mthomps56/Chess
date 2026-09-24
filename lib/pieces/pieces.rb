# frozen_string_literal: true

require 'pry-byebug'
require 'colorize'
require_relative 'moves'
require_relative 'utf_codes'

# Chess Piece objects that can represent any legal Chess piece
class Piece
  include Moves
  include ChessPieces

  SCOPE_HIGH = 7
  SCOPE_LOW  = 0

  attr_accessor :type, :symbol, :moves, :owner, :active, :location, :iterable

  def initialize(fen_char, location)
    @owner    = find_owner(fen_char)
    @type     = find_type(fen_char)
    @symbol   = find_symbol(type)
    @moves    = find_moves(type)
    @iterable = iterable_move?
    @location = location
    @active   = true
  end
  
  # 1 Will the piece call 'find_legal_moves' for non-iterative pieces or 
  # 'find_legal_moves_set' for iterative pieces
  def iterable_move?
   iterable = case type
    when 'rook', 'ROOK', 'bishop', 'BISHOP', 'queen', 'QUEEN' then true
    else false
    end
  end

  # 2 All directions regardless is out of bounds 
  def get_movement_directions
    move_directions = moves.map { | move_dir, direction | direction }
  end

  # 3 (if not iterable) Removes out of bounds options
  def get_initial_moves(movement_directions, piece_location)
    locations = movement_directions.map do |direction|
      [direction[0] + piece_location[0], direction[1] + piece_location[1]]
    end
  end

  # 4 Moves for non-iterative pieces
  def find_legal_moves(locations)#movement_directions, piece_location)
    possible_locations = locations.select do |location| 
      x_scope = location[0] <= SCOPE_HIGH && location[0] >= SCOPE_LOW
      y_scope = location[1] <= SCOPE_HIGH && location[1] >= SCOPE_LOW
      location if x_scope && y_scope
    end
    return possible_locations
  end
  
# MOVES-FOR-ITERATIVE-PIECES----------------------------------------------------
  # Used in 'Player' class; method: 'choose_space_to_move_to'
  def get_iterative_moves(chosen_location)
    possible_moves = []
    moves.each do |key, dir| 
      possible_moves << take_step(chosen_location, dir, direction = [])
    end
    return possible_moves
  end

  # Takes recursive array's of move sets, flattens them, 
  # and re-organizes them in to [y, x] coordinates. 
  # Used in 'Player' class; method: 'choose_space_to_move_to'
  def flatten_possible_moves(possible_moves)
    flattened_possible_moves = possible_moves.flatten
    y_coord = 0; x_coord = y_coord + 1; possible_moves_array = []
    while x_coord <= flattened_possible_moves.length
      pair = [flattened_possible_moves[y_coord], flattened_possible_moves[x_coord]]
      possible_moves_array << pair
      y_coord = y_coord + 2; x_coord = x_coord + 2;
    end
    puts; print possible_moves_array
    return possible_moves_array
  end

  def take_step(curr, dir, direction = [])
    position = [curr[0] + dir[0], curr[1] + dir[1]]
    x_scope  = position[0] <= SCOPE_HIGH && position[0] >= SCOPE_LOW
    y_scope  = position[1] <= SCOPE_HIGH && position[1] >= SCOPE_LOW 
    if x_scope && y_scope
      direction << position
      take_step(position, dir, direction)
    else
      return direction
    end
  end
#-------------------------------------------------------------------------------

  def find_type(fen_char)
    case fen_char
    when 'k' then 'king'
    when 'K' then 'KING'
    when 'q' then 'queen'
    when 'Q' then 'QUEEN'
    when 'r' then 'rook'
    when 'R' then 'ROOK'
    when 'b' then 'bishop'
    when 'B' then 'BISHOP'
    when 'n' then 'knight'
    when 'N' then 'KNIGHT'
    when 'p' then 'pawn'
    when 'P' then 'PAWN'
    when '*' then 'EMPTY'
    end
  end

  def find_symbol(type)
    PIECES.each { |name, char| return char if name.start_with?(type) }
  end

  def find_moves(type)
    MOVES.each { |name, moves| return moves if type.upcase.eql?(name) }
  end

  def find_owner(fen_char)
    fen_char.eql?(fen_char.upcase) ? 1 : 2
  end
end
