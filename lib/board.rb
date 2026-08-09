# frozen_string_literal: true

require 'colorize'
require 'pry-byebug'
#require_relative 'board'
require_relative 'space'
require_relative 'pieces/pieces'
require_relative './fen/load_fen'

class Board

#  X_ROW, Y_COL = (1..8).to_a, (1..8).to_a
  X_ROW, Y_COL = (0..7).to_a, (0..7).to_a
#  WHITE_SPACES_EVEN = [2, 4, 6, 8] 
#  WHITE_SPACES_ODD  = [1, 3, 5, 7]
  WHITE_SPACES_EVEN = [0, 2, 4, 6] 
  WHITE_SPACES_ODD  = [1, 3, 5, 7]

  attr_accessor :spaces, :pieces

  def initialize(save)
    @spaces = {}
    @pieces = {}
    make_board(save)
  end

  def make_board(save, pieces = {})  # 'save' arg is a fen string.
    Y_COL.each do |y|
      white_space = y.even? ? WHITE_SPACES_EVEN : WHITE_SPACES_ODD
      X_ROW.each do |x|
        char = save[y][x]
        color = white_space.include?(x) ? :grey : :white
#        binding.pry
#        piece = char.eql?('*') ? nil : Piece.new(char, [x, y])
        piece = Piece.new(char, [x, y])
        spaces[[x, y]] = Space.new(color, piece, piece.symbol)
        make_piece_set(piece)
      end
    end
  end

  def make_piece_set(piece)
    if pieces.keys.include?(piece.type)
      type_number = piece.type[-1].to_i
      piece_instance_name = piece.type[0..-2] + (type_number + 1).to_s
      self.pieces[piece_instance_name] = piece
    else
      self.pieces[piece.type] = piece
    end
  end

#  def find_pieces_count



  def print_board(locations, og_color)
    highlight_space(locations[:curr], locations[:prev], og_color)
    Y_COL.each do |y|
      X_ROW.each do |x|
        spaces[[x, y]].print_space
        puts if x.eql? 7
      end
    end
  end

  def highlight_space(curr_location, prev_location, og_color)
    self.spaces[curr_location].background = 
      spaces[curr_location].background.colorize(color: :light_green)
    un_highlight_space(prev_location, og_color)
  end

  def un_highlight_space(prev_location, og_color)
    og_color = og_color.eql?(1) ? Piece::PLAYER_1_COLOR : Piece::PLAYER_2_COLOR
    self.spaces[prev_location].background = 
      spaces[prev_location].background.colorize(color: og_color)
  end

end

