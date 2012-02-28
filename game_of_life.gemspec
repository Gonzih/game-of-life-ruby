# -*- encoding: utf-8 -*-
require File.expand_path('../lib/game_of_life/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Max Gonzih"]
  gem.email         = ["gonzih@gmail.com"]
  gem.description   = 'Simple Implementation of Conway\'s Game of Life in Ruby'
  gem.summary       = 'Conway\'s Game of Life in Ruby'
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "game_of_life"
  gem.require_paths = ["lib"]
  gem.version       = GameOfLife::VERSION

  gem.add_dependency 'thor',     '~> 0.14.6'

  gem.add_development_dependency 'bundler',     '>= 1.0'
  gem.add_development_dependency 'rspec',       '~> 2.8'
  gem.add_development_dependency 'guard',       '~> 1.0.0'
  gem.add_development_dependency 'guard-rspec', '~> 0.6.0'
  gem.add_development_dependency 'simplecov',   '~> 0.5.4'
  gem.add_development_dependency 'gtk2',        '~> 1.1.2'
end
