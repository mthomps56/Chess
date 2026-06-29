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
    @white_space = '[' + '  '.colorize(:white) + ']'
    make_board
    print_board
  end
  def make_board
    Y_ROW.times do |y|
      y += 1
      white_space = y.even? ? WHITE_SPACES_EVEN : WHITE_SPACES_ODD
      X_COL.times do |x|
        x += 1
        if white_space.include?(x)
          self.spaces[[x, y]] = Space.new(
            visual: '  '.colorize(background: :white))
        else
          self.spaces[[x, y]] = Space.new(
            visual: '  '.colorize(background: :grey))
        end
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
  end

  def highlight_space(loc, previous_space)
    self.spaces[loc].visual = '  '.colorize(background: :green)
    puts
    print previous_space
    puts
    un_highlight_previous_space(previous_space)
  end

  private
  # Find the color of the space argument. Used inside 'change_current_loc_color'
  # to change the highlight back to its original board color. 
  def un_highlight_previous_space(space)
   self.spaces[space].visual = spaces[space].color
  end

  def check_bounds(location)
    
  end


end

