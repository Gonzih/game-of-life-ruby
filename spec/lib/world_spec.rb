require 'spec_helper'

describe World do
  describe 'utilites methods' do
    let (:world) { world = World.new(3, 6, false) }

    it 'creates new world with cells' do
      world.cells.count.should       == 3
      world.cells.first.count.should == 6
    end

    describe '#[] provide access to @cells' do
      it 'allow get' do
        world[1][1].should == world.cells[1][1]
      end

      it 'allow set' do
        world[1][2].revive!
        world[1][2].alive?.should be_true
      end
    end

    describe '#alive_neighbours' do
      it 'detects neighbour on the up left' do
        world[1][2].revive!
        world[2][2].revive!
        world.alive_neighbours(1, 1).should == 2
      end
    end
  end

  describe 'Rule #1: Any live cell with fewer than two live neighbours dies, as if caused by under-population.' do
  end

  describe 'Rule #2: Any live cell with two or three live neighbours lives on to the next generation.' do
  end

  describe 'Rule #3: Any live cell with more than three live neighbours dies, as if by overcrowding.' do
  end

  describe 'Rule #4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.' do
  end
end
