class Show

  def show_board(grid)
    #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
    puts " #{grid[0].value} | #{grid[1].value} | #{grid[2].value} "
    puts "---+---+---"
    puts " #{grid[3].value} | #{grid[4].value} | #{grid[5].value} "
    puts "---+---+---"
    puts " #{grid[6].value} | #{grid[7].value} | #{grid[8].value} "
  end

end