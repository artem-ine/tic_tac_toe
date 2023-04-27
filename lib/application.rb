class Application
  
  def perform

    puts "What's your name?"
    player1 = gets.chomp
    print "\n"
    puts "What's your name?"
    player2 = gets.chomp
    print "\n"

    new_game = Game.new(player1, player2)
    print "\n"
    new_game.turn
    print "\n"
    new_game.score
    print "\n"
    puts "Type 'revenge' to play another round. Type 'exit' to leave the game."
    revenge = gets.chomp

    while revenge == "revenge"
      new_game.new_round
      print "\n"
      new_game.turn
      print "\n"
      new_game.score
      print "\n"
      puts "Type 'revenge' to play another round. Type 'exit' to leave the game."
      revenge = gets.chomp  
    end

  end

end
