

module GameProcs

  GET_PLAYER_PIECES = Proc.new do |pieces|
    player_1_pieces, player_2_pieces = {}, {}
    pieces.keys.each do |key|
      pieces[key].owner.eql?(1) ? (player_1_pieces[key] = pieces[key])
                                : (player_2_pieces[key] = pieces[key])
    end
   [player_1_pieces, player_2_pieces] 
  end

end


