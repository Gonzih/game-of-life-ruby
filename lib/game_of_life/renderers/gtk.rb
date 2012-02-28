begin
  require 'gtk2'
rescue LoadError
  STDERR.puts 'Please install gtk2 gem first'
  exit
end

module GameOfLife
  module Renderers
    class GTK
      def run
        Gtk.init
        window = Window.new
        Gtk.main
      end
    end

    class Window < Gtk::Window
      def initialize
        @cell_size = 5

        super

        set_title 'Game of Life'
        signal_connect 'destroy' do
          Gtk.main_quit
        end

        init_ui
        set_default_size(get_width, get_height)
        fullscreen

        set_window_position Gtk::Window::POS_CENTER

        show_all
      end

      def get_height
        Gdk::Screen.default.height
      end

      def get_width
        Gdk::Screen.default.width
      end

      def init_ui
        @darea = Gtk::DrawingArea.new

        @darea.signal_connect 'expose_event' do
          on_expose
        end

        add(@darea)
      end

      def on_expose
        Gtk.timeout_remove(@_timeout_id) if @_timeout_id
        @_timeout_id = Gtk.timeout_add(1000) { self.world_render }
      end

      def cr
        @cr ||= @darea.window.create_cairo_context
      end

      def clear
        cr.set_source_rgb(1, 1, 1)
        cr.paint
      end

      def cell(x1, y1, w, h)
        cr.set_source_rgb(0, 0, 0)
        cr.rectangle(x1, y1, w, h)
        cr.fill
      end

      def world
        @world ||= GameOfLife::World.new(get_width / @cell_size, get_height / @cell_size)
      end

      def world_render
        clear

        world.cells.each_with_index do |col, x|
          col.each_with_index do |_cell, y|
            _x = x * @cell_size
            _y = y * @cell_size
            cell(_x, _y, @cell_size, @cell_size) if _cell.alive?
          end
        end

        world.next!
      end
    end
  end
end
