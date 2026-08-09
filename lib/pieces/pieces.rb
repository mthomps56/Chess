# frozen_string_literal: true

require 'pry-byebug'
require 'colorize'
require_relative 'moves'
require_relative 'utf_codes'

class Piece

  include Moves
  include ChessPieces

  attr_accessor :type, :symbol, :moves, :owner, :location, :active
  
  PLAYER_1_COLOR, PLAYER_2_COLOR = :light_yellow, :blue
  LOW, HIGH = 0, 7
  
  def initialize(fen_char, location)
    @owner    = find_owner(fen_char)
    @type     = find_type(fen_char, owner) 
    @symbol   = find_symbol(type)
    @moves    = find_moves(type)
    @location = location
    @active   = true
  end

  
  def find_type(fen_char, owner)
    type = case fen_char
           when 'k' then 'king_'   + owner.to_s
           when 'K' then 'king_'   + owner.to_s
           when 'q' then 'queen_'  + owner.to_s
           when 'Q' then 'queen_'  + owner.to_s
           when 'r' then 'rook_'   + owner.to_s
           when 'R' then 'ROOK_'   + owner.to_s
           when 'b' then 'bishop_' + owner.to_s
           when 'B' then 'bishop_' + owner.to_s
           when 'n' then 'knight_' + owner.to_s
           when 'N' then 'knight_' + owner.to_s
           when 'p' then 'pawn_'   + owner.to_s
           when 'P' then 'pawn_'   + owner.to_s
           when '*' then 'empty'  
           end
  end

  def find_symbol(type)
    PIECES.each { |name, char| return char if name.start_with?(type.upcase) }
  end

  def find_moves(type)
    MOVES.each { |name, moves| return moves if name.eql?(type.upcase) }
  end

  def find_owner(fen_char)
    fen_char.eql?(fen_char.upcase) ? 1 : 2
  end

  #def check_bounds(this_step, high, low)
  #  x_check = true if this_step.first >= LOW && this_step.first <= HIGH
  #  y_check = true if this_step.last  >= LOW && this_step.last  <= HIGH
  #  x_check && y_check 
  #end
end
