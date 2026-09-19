# frozen_string_literal: true

require './lib/pieces/pieces'

RSpec.describe Piece do
  let(:piece) { Piece.new('b', [7, 5]) }
  describe '#iterable_move?' do
    it 'is iterable' do
      expect(piece.iterable).to be true
    end
  end
  describe '#iterable_legal_moves' do
    it 'correctly calculates max_movement' do
      movement_directions = [[-1, 1], [1, 1], [-1, -1], [1, -1]]
      possible_locations = piece.get_legal_moves(movement_directions, [7, 5])
      expect(possible_locations).to eql [[6, 6], [6, 4]]
    end
   end
end
