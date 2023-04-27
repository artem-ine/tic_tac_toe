class Board
  attr_accessor :grid, :count_turn 

  def initialize
    @grid = []
    @grid += [
      BoardCase.new("A1"),
      BoardCase.new("B1"),
      BoardCase.new("C1"),
      BoardCase.new("A2"),
      BoardCase.new("B2"),
      BoardCase.new("C2"),
      BoardCase.new("A3"),
      BoardCase.new("B3"),
      BoardCase.new("C3")
    ]

    @count_turn = 0
    return @grid
  end

  def play_turn(current_player, player_symbol)
    puts "#{current_player}, pick a case on the grid."
    player_choice = gets.chomp

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