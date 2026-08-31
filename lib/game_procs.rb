module GameProcs
  GET_PLAYER_PIECES = proc do |pieces|
    player_1_pieces = {}
    player_2_pieces = {}
    pieces.keys.each do |key|
      if pieces[key].owner.eql?(1)
        (player_1_pieces[key] = pieces[key])
      else
        (player_2_pieces[key] = pieces[key])
      end
    end
    [player_1_pieces, player_2_pieces]
  end
end
