require './lib/game_of_life'

height = `tput lines`.to_i || 40
width  = `tput cols`.to_i  || 40

world = GameOfLife::World.new(width, height)

loop do
  output = world.to_s
  system('clear')
  puts output
  world.next!
  sleep(0.1)
end
