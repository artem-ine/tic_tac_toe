require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/boardcase'
require_relative 'lib/player'
require_relative 'lib/show'


puts "What's your name?"
player1 = gets.chomp
puts "What's your name?"
player2 = gets.chomp


new_game = Game.new(player1, player2)
new_game.turn
new_game.new_round
