begin
  require 'tk'
rescue LoadError
  STDERR.puts 'Please install Tk Bindings for ruby first'
  exit
end

module GameOfLife
  module Renderers
    class TK
      def initialize
        @cell_size = 5
        @_tmp = {}
      end

      def run
        get_sizes
        tk_setup
        world_setup
        world_render
      end

      def world_setup
        @world = GameOfLife::World.new(@height / @cell_size, @width / @cell_size, )
      end

      def world_render
        loop do
          @world.cells.each_with_index do |col, x|
            col.each_with_index do |_cell, y|
              _x = x * @cell_size
              _y = y * @cell_size
              tmp_key = "#{x}:#{y}"
              if _cell.alive?
                @_tmp[tmp_key] = cell(_x, _y, _x + @cell_size, _y + @cell_size)
              else
                if @_tmp[tmp_key]
                  canvas.delete(@_tmp[tmp_key])
                  @_tmp[tmp_key] = nil
                end
              end
            end
          end
          @world.next!
        end
      end

      def root
        @tk_root ||= Tk.root
      end

      def canvas
        @tk_canvas ||= TkCanvas.new(width: @width, height: @height).pack
      end

      def cell(x1, y1, x2, y2)
        TkcRectangle.new(canvas, x1, y1, x2, y2,
                         outline: 'black', fill: 'black')
      end

      def get_sizes
        @width  = root.winfo_screenwidth
        @height = root.winfo_screenheight
      end

      def tk_setup
        root.withdraw
        root.overrideredirect = true
        root.deiconify
        root.geometry = "#{@width}x#{@height}+0+0"
        root.bind('3') { exit }

        @tk_loop = Thread.new { Tk.mainloop }
      end
    end
  end
end
