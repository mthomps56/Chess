# frozen_string_literal: true

require 'pry-byebug'
require_relative '../pieces/pawn'
require_relative '../pieces/rook'
require_relative '../pieces/king'
require_relative '../pieces/queen'
require_relative '../pieces/knight'
require_relative '../pieces/bishop'

class LoadFen
  attr_accessor :load

  def initialize
    @load = proc do |space, x, y|
    end
  end

  #  def iterate_fen_strings(fen_array)
  #    fen_array.each_char do |char|

  def process_fen_data(path)
    file = open_save(path)
    fen_string = get_fen_string(file)
    split_string(fen_string)
  end

  # Called in 'process_fen_data'.
  # Opens a saved game formatted in FEN.
  def open_save(path)
    File.open(path, 'r')
  end

  # Called in 'process_fen_data'.
  # Reads the Fen string in to a variable from a save file.
  def get_fen_string(file)
    file.readline
  end

  # Called in 'process_fen_data'.
  # Sperates the Fen string in to an array of Strings, one
  # string for every row on the x axis
  def split_string(fen_string)
    fen_rows = []
    fen_string.each_line('/', chomp: true) do |line|
      fen_rows << line.chomp
    end
    fen_rows
  end

  def get_space_content(fen_char)
    case fen_char
    when 'P' then Pawn.new(1) # Player 1
    when 'p' then Pawn.new(2) # player 2

    when 'R' then Rook.new(1) # Player 1
    when 'r' then Rook.new(2) # Player 2

    when 'K' then King.new(1) # Player 1
    when 'k' then King.new(2) # Player 2

    when 'Q'  then Queen.new(1) # Player 1
    when 'q'  then Queen.new(2) # Player 2

    when 'B'  then Bishop.new(1) # Player 1
    when 'b'  then Bishop.new(2) # Player 2

    when 'N' then Knight.new(1) # Player 1
    when 'n' then Knight.new(2) # Player 2

    when nil then count_consecutive_empty_spaces(board)
    end
  end
end
# loadfen = LoadFen.new
# fen_array = loadfen.process_fen_data('./lib/fen/saves/new_game.fen')
# puts fen_array
