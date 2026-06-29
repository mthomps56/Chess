# frozen_string_literal: true

class Game
  BOUNDS = { HIGH: 8, LOW: 1 }
  attr_accessor :check, :player_in_check, :checkmate

  def initialize
    @check = false
    @player_in_check = nil
    @checkmate = false
  end

  def in_bounds?(loc)
    valid_x = loc[0] <= BOUNDS[:HIGH] && loc[0] >= BOUNDS[:LOW] ? true : false
    valid_y = loc[1] <= BOUNDS[:HIGH] && loc[1] >= BOUNDS[:LOW] ? true : false
    valid_x && valid_y ? (return true) : (return false)
  end
  
  def check_bounds(flag = false)
    unless flag
      flag = yield if block_given?
    end
  end
end
