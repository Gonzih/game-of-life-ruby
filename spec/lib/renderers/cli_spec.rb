require 'spec_helper'

describe GameOfLife::Renderers::Cli do
  let (:game) { GameOfLife::Renderers::Cli.new }

  describe GameOfLife::Cell do
    let (:cell) { GameOfLife::Cell.new(false) }

    it 'should add #to_s methods to cell' do
      game.include_methods
      cell.should respond_to(:to_s)
    end

    it '#to_s method should render cell state' do
      game.include_methods

      cell.alive = true
      cell.to_s.should == 'o'
      cell.alive = false
      cell.to_s.should == ' '
    end
  end

  describe GameOfLife::Cell do
    let (:world) { game.world }

    it 'should add #to_s methods to cell' do
      game.world.should respond_to(:to_s)
    end

    it 'should render lines in count equal to height' do
      world.to_s.lines.count.should == world.height
    end

    it' should render cols in count equal to width' do
      world.to_s.lines.first.length.should == world.width + 1
    end
  end
end
