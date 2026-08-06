# frozen_string_literal: true
require 'pry-byebug'
require_relative './lib/fen/load_fen'
require_relative './lib/board'
require_relative './lib/instructions'
require_relative './lib/board'
require_relative './lib/space'

loader = FenLoad.new('./lib/fen/saves/new_game.fen')
# loader.fen_array
b = Board.new(loader.fen_array)
