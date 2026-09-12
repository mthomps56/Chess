  # Used in 'make_board'
#  def do_player_piece_assignment(piece)
#    collect_pieces(piece)
#    sort_pieces(piece)
#  end
  
#  # Used in 'do_player_piece_assignment'
#  def collect_pieces(piece)
#    return if piece.type.eql?('EMPTY')

#    count = pieces.keys.select { |key| key.include?(piece.type) }
#    pieces[piece.type + '_' + count.length.to_s] = piece
#  end

  # Used in 'do_player_piece_assignment'
#  def sort_pieces(piece)
#    key = piece.key?
#    if piece[key].eql?(key.upcase)
#      (player_1_pieces[key] = piece)
#    else
#      (player_2_pieces[key] = piece)
#    end
#  end


