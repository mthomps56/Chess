# frozen_string_literal true

# Load the pieces for a new or for an unfinished saved game.

class FenLoad
  attr_accessor :file, :fen_string, :fen_array, :line_array

  def initialize(path)
    @file = File.new(path, 'r')
    @fen_string = get_string
    @fen_array = split_string
    process_fen_array
  end

#  def show_fen_string_class
#    puts self.fen_string.class
#  end
  
  private

  def get_string
    file.readline.chomp
  end

  # Split the FEN string in to an array of strings.
  def split_string
    self.fen_array = fen_string.split('/')
  end

  def process_fen_array
    new_fen_array = []
    fen_array.each do |line|
      new_fen_array << expand_line(line)
    end
    self.fen_array = new_fen_array
  end

  def expand_line(line, new_fen_line = '')
    line.each_char do |char|
      if (1..8).include?(char.to_i)
        blanks = ''
        char.to_i.times { |_i| blanks += '*' }
        new_fen_line << blanks
      else
        new_fen_line << char
      end
    end
    new_fen_line
  end
end
