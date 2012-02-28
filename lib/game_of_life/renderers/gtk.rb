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

        @darea.signal_connect 'expose-event' do
          on_expose
        end

        add(@darea)
      end

      def on_expose
        @cr = @darea.window.create_cairo_context
        draw_colors
        start_game
      end

      def clear
        @cr.set_source_rgb 1, 1, 1
        @cr.paint
      end

      def draw_colors
        clear

        @cr.set_source_rgb 0, 0, 0
        @cr.rectangle 10, 15, 90, 60
        @cr.fill

        clear

        @cr.set_source_rgb 0, 0, 0
        @cr.rectangle 130, 15, 90, 60
        @cr.fill

        @cr.set_source_rgb 0, 0, 0
        @cr.rectangle 250, 15, 90, 60
        @cr.fill
      end

      def start_game
        @world = GameOfLife::World.new(get_height / @cell_size, get_width / @cell_size, )
      end
    end
  end
end
