module GameOfLife
  class Cell
    attr_accessor :alive, :neighbours

    def initialize(seed_probability)
      if seed_probability.is_a?(Numeric)
        @alive = seed_probability > rand
      else
        @alive = seed_probability
      end
    end

    def alive?
      @alive
    end

    def to_i
      if alive? then 1 else 0 end
    end

    def die!
      @alive = false
    end

    def revive!
      @alive = true
    end

    def next!
      if alive?
        die! if @neighbours < 2 ||  # Rule 1
                @neighbours > 3     # Rule 3
      else
        revive! if @neighbours == 3 # Rule 4
      end
    end
  end
end
