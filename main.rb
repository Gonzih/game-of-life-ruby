require 'bundler'
Bundler.require(:default) if defined?(Bundler)

require './lib/world'
require './lib/cell'

height = `tput lines`.to_i || 40
width  = `tput cols`.to_i  || 40

world = World.new(width, height)

loop do
  output = world.to_s
  system('clear')
  puts output
  world.next!
  sleep(0.1)
end
