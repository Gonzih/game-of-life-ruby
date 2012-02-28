begin
  require 'gtk2'
rescue LoadError
  STDERR.puts 'Please install gtk2 gem first'
  exit
end

module GameOfLife
  module Renderers
    class Gtk
      def initialize
        @cell_size = 5
      end

      def run
        raise 'GameOfLife::Renderers::Gtk#run must be defined'
      end
    end
  end
end
