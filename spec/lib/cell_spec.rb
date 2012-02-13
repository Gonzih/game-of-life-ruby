require 'spec_helper'

describe Cell do
  describe 'utilites methods' do
    let (:cell) { Cell.new(rand) }

    it '#alive? method should return cell state' do
      cell.alive = true
      cell.alive?.should be_true
      cell.alive = false
      cell.alive?.should be_false
    end

    it '#to_s method should render it state' do
      cell.alive = true
      cell.to_s.should == 'o'
      cell.alive = false
      cell.to_s.should == ' '
    end

    it '#to_i method should return it state' do
      cell.alive = true
      cell.to_i.should == 1
      cell.alive = false
      cell.to_i.should == 0
    end

    it '#die! method kills cell' do
      cell.die!
      cell.alive?.should be_false
    end

    it '#revive method revives cell' do
      cell.revive!
      cell.alive?.should be_true
    end

    describe '#next' do
      let (:cell) { Cell.new(true) }

      it 'should kill alive cell with fewer than 2 live neighbours' do
        cell.neighbours = 1
        cell.next!
        cell.should_not be_alive
      end

      it 'should keep alive with 2 live neighbours' do
        cell.neighbours = 2
        cell.next!
        cell.should be_alive
      end

      it 'should keep alive with 3 live neighbours' do
        cell.neighbours = 3
        cell.next!
        cell.should be_alive
      end

      it 'should kill alive cell with more than 3 live neighbours' do
        cell.neighbours = 4
        cell.next!
        cell.should_not be_alive
      end

      it 'should revive dead cell with 3 alive neighbours' do
        cell.die!
        cell.neighbours = 3
        cell.next!
        cell.should be_alive
      end
    end
  end
end
