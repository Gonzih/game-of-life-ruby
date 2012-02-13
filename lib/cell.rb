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

  def to_s
    if alive? then 'o' else ' ' end
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
end
