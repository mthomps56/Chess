j frozen_string_literal: true

# Load the pieces for a new game or for an unfinished saved game.

class FenLoad
  attr_accessor :file, :fen_string, :fen_array 

  def initialize(path)
    @file = File.new(path, 'r')
    @fen_string = get_string
    @fen_array = split_string

  end

  def get_string
    file.readline
  end

  def split_string
    self.fen_array = fen_string.split('/')
  end
  
  def get_fen
    @fen_array
  end
end
loader = FenLoad.new('./saves/new_game.fen')

puts loader.get_fen




  
