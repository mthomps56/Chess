# frozen_string_literal: true

require './lib/pieces_container/pieces/utf_codes'
require './lib/pieces_container/pieces/bishop'
require './lib/board'

RSpec.describe ChessPieces do
  describe 'it prints a white pawn' do
    it 'equals the unicode number' do
      expect(ChessPieces::W_PAWN.ord).to eql 9817
    end
  end

  describe Board do
    context 'returns possible movements from given location' do
      it 'contains the predicted spaces' do
      end
    end
  end
end
