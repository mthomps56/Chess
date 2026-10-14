# frozen_string_literal: true

# Logic for pawn capturing and two space first move.
module PawnLogic
  def pawn_selected?
    self.type.eql? 'PAWN' || 'pawn'
  end

  def pawns_first_move?
    puts "pawn selected"
    self.moves.delete(:first_move_only) if pawn_selected?
  end

  def allow_enemy_capture(enemy_location)
    held_for_this_turn = []
      held_for_this_turn = 
        case 
        when enemy_location[1] > self.location[1]
        self.moves.delete(:diag_take_left)
        when enemy_location[1] < self.location[1]
        self.moves.delete(:diag_take_right)
        else
          held_for_this_turn << self.moves.delete(:diag_take_left)
          held_for_this_turn << self.moves.delete(:diag_take_right)
        end
  end

  def reset_pawn_moves(moves)
    self.moves[:diag_take_left]  = moves[0]
    self.moves[:diag_take_right] = moves[1]
  end

end

