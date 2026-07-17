# frozen_string_literal: true

require 'colorize'
require_relative 'space'


class Board
  attr_accessor :spaces, :white_space

  X_COL, Y_ROW = 8, 8
  BOUNDS = [X_COL, Y_ROW]

  WHITE_SPACES_EVEN  = [2, 4, 6, 8]
  WHITE_SPACES_ODD = [1, 3, 5, 7]

  def initialize
    @spaces = {}
    make_board
    print_board
  end

  def make_board
    Y_ROW.times do |y|
      y += 1
      white_space = y.even? ? WHITE_SPACES_EVEN : WHITE_SPACES_ODD
      X_COL.times do |x|
        x += 1
        background = white_space.include?(x) ? :white : :grey
        spaces[[x, y]] = Space.new(visual = "  ".colorize(
          background: background))
      end 
    end
  end

  def print_board
    Y_ROW.times do |y|
      y += 1
      X_COL.times do |x|
        x += 1
        print spaces[[x,y]].visual
        puts if x == X_COL
      end
    end
    puts
  end

  # Iterate through each direction and get all possible available movements
  # for a piece.
  def get_piece_moves(piece, location, piece_checks = nil)
    one_step_pieces = ['Pawn', 'King', 'Knight']
    piece_checks.call(spaces) unless piece_checks.nil?
    legal_moves = make_mv_hash(piece) 
    piece.mv.each do |name, dir|
      legal_moves[name] = one_step_pieces.include?(piece.class.name) ?
        take_one_step(location, dir) : proceed(location, dir)
#        legal_moves[name] = proceed(location, dir) 
    end
    return legal_moves
  end

  # Create a new Hash with the same keys as 'mv' with an empty array for each.
  def make_mv_hash(piece)
    legal_moves = {}
    piece.mv.each_key { |key| legal_moves[key] = [] }
    legal_moves
  end

  # Take the current iteration's direction 'dir' as far as allowed. 
  def proceed(current, dir, moves = [])
    current = [current[0] + dir[0], current[1] + dir[1]] # Get next direction.
    return moves if spaces.dig(current).nil? # Is the next move out of bounds?
    if spaces.dig(current).piece.nil?            # Is the next space occupied?
      print "moves: #{moves} \n"
      proceed(current, dir, moves << current)   # Add space, try next in line.
    end
  end

  # Get possible locations for pieces that can only take one step a turn.
  def take_one_step(current, dir, moves = [])
    moves << [current[0] + dir[0], current[1] + dir[1]]
  end

  def highlight_space(loc, prev_location)
    self.spaces[loc].visual = '  '.colorize(background: :green)
    un_highlight_previous_space(prev_location)
  end

  private

  # Find the color of the space argument. Used inside 'change_current_loc_color'
  # to change the highlight back to its original board color. 
  def un_highlight_previous_space(space)
    self.spaces[space].visual = spaces[space].color
  end

end

