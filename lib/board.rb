class Board
  attr_accessor :grid, :count_turn 
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué


  def initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    a1 = BoardCase.new("A1")
    b1 = BoardCase.new("B1")
    c1 = BoardCase.new("C1")
    a2 = BoardCase.new("A2")
    b2 = BoardCase.new("B2")
    c2 = BoardCase.new("C2")
    a3 = BoardCase.new("A3")
    b3 = BoardCase.new("B3")
    c3 = BoardCase.new("C3")

    @grid = []
    @grid += [a1, a2, a3, b1, b2, b3, c1, c2, c3]
    @count_turn = 0
    return @grid
  end

  def play_turn(current_player, player_symbol)
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    puts "#{current_player}, pick a case on the grid."
    player_choice = gets.chomp
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)

    grid.each do |boardcase|
      if boardcase.id == player_choice
        if boardcase.value == " "
          boardcase.value = player_symbol
          @count_turn += 1
        else 
          puts "This case is already occupied. Please choose another case."
          print "\n"
          play_turn(current_player, player_symbol)
        end
      end
    end
  end

  def draw?
    @count_turn == 9
  end

  def victory?
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
    if grid[0].value == grid[1].value && grid[1].value == grid[2].value && grid[0].value != " "
      winner = grid[0].value
    elsif grid[3].value == grid[4].value && grid[4].value == grid[5].value && grid[3].value != " "
      winner = grid[3].value
    elsif grid[6].value == grid[7].value && grid[7].value == grid[8].value && grid[6].value != " "
      winner = grid[6].value

    elsif grid[0].value == grid[3].value && grid[3].value == grid[6].value && grid[0].value != " "
      winner = grid[0].value
    elsif grid[1].value == grid[4].value && grid[4].value == grid[7].value && grid[1].value != " "
      winner = grid[1].value
    elsif grid[2].value == grid[5].value && grid[5].value == grid[8].value && grid[2].value != " "
      winner = grid[2].value

    elsif grid[0].value == grid[4].value && grid[4].value == grid[8].value && grid[0].value != " "
      winner = grid[0].value
    elsif grid[2].value == grid[4].value && grid[4].value == grid[6].value && grid[2].value != " "
      winner = grid[2].value
    else
      winner = nil
    end


    return winner
  end

end