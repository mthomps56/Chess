# frozen_string_literal: true

require_relative './fen/load_fen'

class Game
  attr_accessor :check, :player_in_check, :checkmate, :start_game

  def initialize
    @check = false
    @player_in_check = nil
    @checkmate = false
  end

  def move_space(curr_space, new_space, board)
    piece = board.spaces[curr_space].piece
    color = board.spaces[curr_space].color
    board.spaces[curr_space].piece = nil
    board.spaces[curr_space].symbol = nil
    board.spaces[curr_space].background = "   ".colorize(background: color)

    puts "new_space: #{new_space}"

    board.spaces[new_space].piece = piece
    board.spaces[new_space].symbol = piece.symbol
    board.spaces[new_space].background = 
      "#{piece.symbol} ".colorize(background: color)

    puts board.spaces[new_space].piece.location
    board.spaces[new_space].color = color
  end
end

