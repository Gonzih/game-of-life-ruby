require 'thor'

module GameOfLife
  class Cli < Thor

    default_task :start

    desc 'start', 'start game'
    method_option :renderer,
                  default: 'cli',
                  aliases: '-r',
                  desc: 'which renderer you want to use.'
    def start
      case options['renderer']
      when 'cli'
        require 'game_of_life/renderers/cli'
        game = GameOfLife::Renderers::Cli.new
      when 'tk'
        require 'game_of_life/renderers/tk'
        game = GameOfLife::Renderers::TK.new
      when 'gtk'
        require 'game_of_life/renderers/gtk'
        game = GameOfLife::Renderers::Gtk.new
      else
        raise 'Undefined renderer was called'
      end

      game.run
    end
  end
end
