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
        game = GameOfLife::Renderers::Cli.new
        game.run
      else
        raise 'Undefined renderer was called'
      end
    end
  end
end
