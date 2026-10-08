CHESS DOCUMENTATION
--------------------------------------------------------------------------------
This README follows main.rb and explains what is happening in the script.
----------------------------------------------------------------------------
main.rb ---
Messages::INSTRUCTIONS shows how to play.
-----
./lib/fen/load_fen.rb
loader = FenLoad.new --> Loads a fen string
    Turns fen string in to an array of strings to be iterative over and loaded.
-----
./lib/board.rb
    Create and load the board. 
    'make_board' method is called at board object creation and loads spaces with
    pieces in the appropriate board spaces.
-----
./lib/player.rb
    Creates player_1 and player_2 objects and stores them in a 'players' array.
-----
    -board is printed and the playe chooses which piece to move
    -The number of active pieces currently on the board is calculated for each
     player.
    -The player uses navigate to choose a piece to move for their turn. The
     current piece the cursor is on turns green.
    -Once this piece is chosen the player can then choose one of the locations
     in red to move it to. 
    

