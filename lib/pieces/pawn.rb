# frozen_string_literal: true

# Logic for pawn capturing and two space first move.
module PawnLogic
  def pawn_selected?
    self.type.eql? 'PAWN' || 'pawn'
  end

  def pawns_first_move?
    self.moves.delete(:first_move_only) if pawn_selected?
  end

  def pawn_captures_valid?(spaces, capture_location)
    location_to_return = nil
    return capture_location unless pawn_selected?
    calculated_location_left = [location[0] + moves[:diag_take_left][0], 
                                 location[1] + moves[:diag_take_left][1]]

    calculated_location_right = [location[0] + moves[:diag_take_right][0], 
                                  location[1] + moves[:diag_take_right][1]]
    calculated_location_forward= [location[0] + 1, location[1] + 1]

    if calculated_location_left.eql? capture_location
      location_to_return = spaces[capture_location].piece.type != 'EMPTY' ? 
        capture_location : nil
    elsif calculated_location_right.eql? capture_location
      location_to_return = spaces[capture_location].piece.type != 'EMPTY' ?
        capture_location : nil
    else
#      location_to_return = capture_location
      location_to_return = spaces[capture_location].piece.type != 'EMPTY' ?
        nil : capture_location
    end
  end

end

