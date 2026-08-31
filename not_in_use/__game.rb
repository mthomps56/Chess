# frozen_string_literal: true

require_relative './fen/load_fen'

class Game
  attr_accessor :check, :player_in_check, :checkmate, :start_game

  def initialize
    @check = false
    @player_in_check = nil
    @checkmate = false
    @start_game = LoadFen.new
  end

  def initiate_choice(path)
    file = start_game.open_save(path)
    start_game.get_fen_string(file)
  end
end
