module GameOfLife
  module Renderers
    module Cli
      class Renderer
        def run
          include_methods
          run_loop
        end

        def include_methods
          GameOfLife::World.send(:include, WorldMethods)
          GameOfLife::Cell.send(:include,  CellMethods)
        end

        def height
          `tput lines`.to_i || 40
        end

        def width
          `tput cols`.to_i  || 40
        end

        def world
          @world ||= GameOfLife::World.new(width, height)
        end

        def run_loop
          loop do
            output = world.to_s
            system('clear')
            puts output
            world.next!
            sleep(0.1)
          end
        end
      end

      module CellMethods
        def to_s
          if alive? then 'o' else ' ' end
        end
      end

      module WorldMethods
        def to_s
          string = ""

          (0...@height).each do |y|
            (0...@width).each do |x|
              string << self[x][y].to_s
            end

            string << "\n"
          end

          string
        end
      end
    end
  end
end
