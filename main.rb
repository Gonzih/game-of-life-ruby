require 'bundler'
Bundler.require(:default) if defined?(Bundler)

require './lib/world'
require './lib/cell'

world = World.new(4, 3)

10.times do
  puts world
  world.next!
  sleep(2)
  system('clear')
end
