# frozen_string_literal: true

module Game
  
  def empty_new_location?(spaces, new_location)
    spaces[new_location].piece.type.eql?('EMPTY') ? true : false
  end

  def call_movement_proc(spaces, current_location, new_location)
    empty = empty_new_location?(spaces, new_location)
    move_to_empty_space.call(space, current_location, new_location) if  empty
    move_to_taken_space.call(space, current_location, new_location) if !empty
  end

  move_to_empty_space = Proc.new do |space, current_location, new_location|
    swap = spaces[new_location].piece
    spaces[new_location].piece = spaces[current_location].piece
    spaces[current_location].piece = swap
    spaces[new_location].symbol = spaces[new_location].piece.symbol
  end

  move_to_taken_space = Proc.new do |space, current_location, new_location|
    space[new_location].piece = space[current_location].piece
    space[new_location].symbol = space[new_location].piece.symbol
    space[current_location].piece = Piece.new(fen_char = '^', current_location)
  end
end
