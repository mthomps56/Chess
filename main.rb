# frozen_string_literal: true
require 'pry-byebug'
require_relative './lib/fen/load_fen'
require_relative './lib/board'
require_relative './lib/instructions'
require_relative './lib/board'
require_relative './lib/space'

binding.pry

loader = FenLoad.new('./lib/fen/saves/new_game.fen')
b = Board.new(loader.get_fen)
