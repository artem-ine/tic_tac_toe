class Game
  attr_accessor :players, :board, :current_player, :status, :victory_count, :draw_count

  def initialize(player1, player2)
    @players = [] 
    player1 = Player.new(player1, "X")
    player2 = Player.new(player2, "O")
    @players << player1 << player2

    @board = Board.new
    show = Show.new
    show.show_board(@board.grid)

    @status = "ongoing"
    @current_player = @players[0]

    @victory_count = {@players[0] => 0, @players[1] => 0}
    @draw_count = 0
  end

  def turn
    
    while @status == "ongoing"
      @board.play_turn(@current_player.name, @current_player.symbol)
      print "\n"
      show = Show.new
      show.show_board(@board.grid)
      print "\n"
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
      puts "Draw."
      @draw_count += 1
    end
    
  end

  def new_round
    puts "New game?"
    @board = Board.new
    show = Show.new
    show.show_board(@board.grid)
  end

  def game_end(winner)
    if winner == @players[0].symbol
      puts "#{@players[0].name} has won."
      @victory_count[@players[0]] += 1
    else 
      puts "#{@players[1].name} has won."
      @victory_count[@players[1]] += 1
    end
  end

  def score
    puts "#{players[0].name} #{@victory_count[@players[0]]} - #{@victory_count[@players[1]]} #{@players[1].name}!"
    puts "The game has come to a draw #{draw_count} time(s)."
  end

end


