require 'bundler'
require 'simplecov'
SimpleCov.configure do
  add_filter do |file|
    file.filename !~ /lib\/game_of_life.*\.rb/
  end
end
SimpleCov.start
require 'game_of_life'
require 'game_of_life/renderers/cli'


