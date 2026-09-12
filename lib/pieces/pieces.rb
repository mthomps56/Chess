# frozen_string_literal: true

require 'pry-byebug'
require 'colorize'
require_relative 'moves'
require_relative 'utf_codes'

class Piece
  include Moves
  include ChessPieces

  attr_accessor :type, :symbol, :moves, :owner, :active, :location

  def initialize(fen_char, location)
    @owner    = find_owner(fen_char)
    @type     = find_type(fen_char)
    @symbol   = find_symbol(type)
    @moves    = find_moves(type)
    @active   = true
    @location = location
  end

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

  public

  private
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
