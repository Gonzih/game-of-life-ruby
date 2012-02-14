require 'bundler/setup'
require 'game_of_life'

game = GameOfLife::Renders::Cli::Renderer.new
game.run
