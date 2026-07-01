# frozen_string_literal: true

class Game
    attr_accessor :check, :player_in_check, :checkmate

  def initialize
    @check = false
    @player_in_check = nil
    @checkmate = false
  end

end
