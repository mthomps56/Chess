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
    @load = Proc.new do |space, background, x, fen_string| 
      piece = get_space_content(fen_string[x])
#      puts "space.piece: #{space.piece}"
#      space.visual = " #{space.piece}"
#      puts "space.visual: #{space.visual}"
      puts fen_string[x]
      space.take_space(piece, background) if piece.class.eql?(String)  
      print space.visual
    end
  end
  
  def open_save(path)
    file = File.open(path, 'r')
  end

  def get_fen_string(file)
    fen_string = file.readline
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

    end
    space_info
  end

end

