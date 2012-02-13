class World
  attr_accessor :cells

  def initialize(width, height, seed_probability = nil)
    seed_probability = rand if seed_probability.nil?

    @width  = width
    @height = height

    @cells = Array.new(width) do
      Array.new(height) do
        Cell.new(seed_probability)
      end
    end
  end

  def [](x)
    @cells[x]
  end

  def next!
    @cells.each_with_index do |col, x|
      col.each_with_index do |cell, y|
        cell.neighbours = alive_neighbours(x, y)
      end
    end

    @cells.each { |row| row.each { |cell| cell.next! } }
  end

  def alive_neighbours(x, y)
    [
      [-1, -1], [0, -1], [1, -1],  # over
      [-1,  0],          [1,  0],  # sides
      [-1,  1], [0,  1], [1,  1]   # under
    ].inject(0) do |sum, pos|
      _x = x + pos[0]
      _y = y + pos[1]

      # if we in the world sizes
      if _x >= 0 && _y >= 0 && _x < @width && _y < @height
        sum += self[_x][_y].to_i
      end

      sum
    end
  end

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
