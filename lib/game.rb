class Game
  attr_accessor :players, :board, :current_player, :status

  def initialize(player1, player2)
    @players = [] 
    player1 = Player.new(player1, "X")
    player2 = Player.new(player2, "O")
    @players << player1 << player2
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    @board = Board.new
    show = Show.new
    show.show_board(@board.grid)
    @status = "ongoing"
    @current_player = @players[0]
  end

  def turn
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    
    
    while @status == "ongoing"
      @board.play_turn(@current_player.name, @current_player.symbol)
      show = Show.new
      show.show_board(@board.grid)
      if @current_player == @players[0]
        @current_player = @players[1]
      else
        @current_player = @players[0]
      end
      break if @board.victory?
      break if @board.draw?
    end
    
    if @board.victory?
      winner = @board.victory?
      game_end(winner)
    else @board.draw?
      puts "Draw"
    end
    
  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
    puts "New game?"
    @board = Board.new
    show = Show.new
    show.show_board(@board.grid)
  end

  def game_end(winner)
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
    if winner == @players[0].symbol
      puts "#{@players[0].name} has won."
    elsif winner == nil
      puts "Draw."
    else 
      puts "#{@players[1].name} has won."
    end
  end    

end


