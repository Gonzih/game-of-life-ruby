module GameOfLife
  module Renderers
    class Tk
      def run
        requrie 'tk'
        TkButton.new(:text=>'quit', :command=>proc{exit}).pack
        r = Tk.root
        r.withdraw
        r.overrideredirect = true
        r.deiconify
        r.geometry = "#{r.winfo_screenwidth}x#{r.winfo_screenheight}+0+0"
        Tk.mainloop
      end
    end
  end
end
