# frozen_string_literal: true
require 'pry-byebug'
require_relative '../pieces/pawn.rb'
require_relative '../pieces/rook.rb'
require_relative '../pieces/king.rb'
require_relative '../pieces/queen.rb'
require_relative '../pieces/knight.rb'
require_relative '../pieces/bishop.rb'

class LoadFen
  attr_accessor :load
  def initialize
    @load = Proc.new do |space, x, fen_string| 
      space.piece = get_space_content(fen_string[x])
      puts "space.piece: #{space.piece}"
      space.visual = " #{space.piece}"
      puts "space.visual: #{space.visual}"
    end
  end

  def process_fen_data(path)
    file = open_save(path)
    fen_string = get_fen_string(file)
    split_string(fen_string)
  end
  
  def open_save(path)
    file = File.open(path, 'r')
  end

  def get_fen_string(file)
    fen_string = file.readline
  end

  def split_string(fen_string)
    fen_rows = []
    fen_string.each_line(line_sep = '/', chomp: true) do |line| 
      fen_rows << line.chomp
    end
    fen_rows
  end

  def get_space_content(fen_char)
    space_info = case fen_char 
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

    when nil  then count_consecutive_empty_spaces(board)
    end
    space_info
  end

end
loadfen = LoadFen.new
fen_array = loadfen.process_fen_data('./lib/fen/saves/new_game.fen')
puts fen_array
