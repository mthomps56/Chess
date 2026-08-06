# frozen_string_literal: true

require 'pry-byebug'
require 'colorize'
require_relative 'moves'
require_relative 'utf_codes'

class Piece

  include Moves
  include ChessPieces

  attr_accessor :type, :symbol, :moves, :owner, :location, :active

  LOW, HIGH = 0, 7
  
  def initialize(fen_char, location)
    @type     = find_type(fen_char) 
    @owner    = find_owner(fen_char)
    @symbol   = find_symbol(type)
    @moves    = find_moves(type)
    @location = location
    @active   = true
  end

  def check_bounds(this_step, high, low)
    x_check = true if this_step.first >= LOW && this_step.first <= HIGH
    y_check = true if this_step.last  >= LOW && this_step.last  <= HIGH
    x_check && y_check 
  end
  
  def find_type(fen_char)

    type = case fen_char
           when 'k' then 'king'
           when 'K' then 'king'
           when 'q' then 'queen'
           when 'Q' then 'queen'
           when 'r' then 'rook'
           when 'R' then 'ROOK'
           when 'b' then 'bishop'
           when 'B' then 'bishop'
           when 'n' then 'knight'
           when 'N' then 'knight'
           when 'p' then 'pawn'
           when 'P' then 'pawn'
           when '*' then 'empty'
           end
  end

  def find_symbol(type)
    PIECES.each { |name, char| return " #{char}" if name.start_with?(type) }
  end

  def find_moves(type)
    MOVES.each { |name, moves| return moves if name.eql?(type) }
  end

  def find_owner(fen_char)
    return '*' if fen_char.eql?('*')
    fen_char.eql?(fen_char.upcase) ? 1 : 2
  end
end

#queen = Piece.new('r', [1, 1])
#puts queen.type
#puts queen.owner
#puts
#puts queen.symbol
#puts
#puts queen.moves
#puts queen.location
