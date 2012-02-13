require 'spec_helper'

describe World do
  describe 'utilites methods' do
    let (:world) { World.new(3, 6, false) }

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
  end

  describe '#alive_neighbours' do
    let (:world) { World.new(3, 3, false) }

    # top row
    it 'detects neighbour on the top left' do
      world[0][0].revive!
      world.alive_neighbours(1, 1).should == 1
    end

    it 'detects neighbour on the top' do
      world[1][0].revive!
      world.alive_neighbours(1, 1).should == 1
    end

    it 'detects neighbour on the top right' do
      world[2][0].revive!
      world.alive_neighbours(1, 1).should == 1
    end

    # middle row
    it 'detects neighbour on the left' do
      world[0][1].revive!
      world.alive_neighbours(1, 1).should == 1
    end

    it 'detects neighbour on the right' do
      world[2][1].revive!
      world.alive_neighbours(1, 1).should == 1
    end

    # bottom row
    it 'detects neighbour on the bottom left' do
      world[0][2].revive!
      world.alive_neighbours(1, 1).should == 1
    end

    it 'detects neighbour on the bottom' do
      world[1][2].revive!
      world.alive_neighbours(1, 1).should == 1
    end

    it 'detects neighbour on the bottom right' do
      world[2][2].revive!
      world.alive_neighbours(1, 1).should == 1
    end

    it 'should not detect itself as neighbour' do
      world[1][1].revive!
      world.alive_neighbours(1, 1).should == 0
    end
  end

  describe '#next!' do
    let (:world) { World.new(3, 3, false) }

    it 'should call #neighbour= and #next method to all cells' do
      cell = double('cell')
      cell.stub(:to_i).and_return(0)
      cell.should_receive(:next!).exactly(9).times
      cell.should_receive(:neighbours=).exactly(9).times

      world.cells = Array.new(world.width) do
        Array.new(world.height) do
          cell
        end
      end

      world.next!
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
