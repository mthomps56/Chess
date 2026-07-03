# frozen_string_literal: true

require './lib/pieces/utf_codes.rb'

RSpec.describe ChessPieces do
  include ChessPieces
  describe 'it prints a white pawn' do
    it 'equals the unicode number' do
      expect(ChessPieces::W_PAWN.ord).to eql 9817
    end
  end
end
