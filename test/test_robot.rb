require './test/test_helper'
require './robot'
require './table'
require 'pry'

describe Robot do
  before do
    @robot = Robot.new
    @table = Table.new(5,5)
  end

  describe 'Placing robot' do
    it 'placed with correct coordinates' do
      @robot.place(1,2,:north, @table)

      @robot.cur_x.must_equal 1
      @robot.cur_y.must_equal 2
      @robot.cur_direction.must_equal :north
      assert @robot.placed?
    end

    it 'cannot be placed outside of the table' do
      @robot.place(-1,-2,:south, @table)
      assert_equal @robot.placed?, false
    end

    it 'can report its position' do
      @robot.place(3,4,:east, @table)
      assert_equal @robot.report, '3,4,east'
    end
  end

  describe 'robot movement' do

    it 'moves north when facing north' do
       @robot.place(1,1,:north, @table)
       @robot.move(@table)

       @robot.cur_x.must_equal 1
       @robot.cur_y.must_equal 2
       @robot.cur_direction.must_equal :north
    end


    it 'moves east when facing east' do
       @robot.place(1,1,:east, @table)
       @robot.move(@table)

       @robot.cur_x.must_equal 2
       @robot.cur_y.must_equal 1
       @robot.cur_direction.must_equal :east
    end

    it 'moves south when facing south' do
       @robot.place(1,1,:south, @table)
       @robot.move(@table)

       @robot.cur_x.must_equal 1
       @robot.cur_y.must_equal 0
       @robot.cur_direction.must_equal :south
    end

    it 'moves west when facing west' do
       @robot.place(1,1,:west, @table)
       @robot.move(@table)

       @robot.cur_x.must_equal 0
       @robot.cur_y.must_equal 1
       @robot.cur_direction.must_equal :west
    end

    it 'cannot move off the table(x coordinate test)' do
       @robot.place(0,0,:west, @table)
       @robot.move(@table)

       @robot.cur_x.must_equal 0
       @robot.cur_y.must_equal 0
       @robot.cur_direction.must_equal :west
    end

    it 'cannot move off the table(y coordinate test)' do
       @robot.place(4,4,:north, @table)
       @robot.move(@table)

       @robot.cur_x.must_equal 4
       @robot.cur_y.must_equal 4
       @robot.cur_direction.must_equal :north
    end
  end

  describe 'robot rotation' do
    # rotate left
    it 'can rotate left' do
       @robot.place(1,1,:south, @table)
       @robot.rotate(:left)

       @robot.cur_x.must_equal 1
       @robot.cur_y.must_equal 1
       @robot.cur_direction.must_equal :east
    end
    # rotate right
    it 'can rotate right' do
       @robot.place(1,1,:north, @table)
       @robot.rotate(:right)

       @robot.cur_x.must_equal 1
       @robot.cur_y.must_equal 1
       @robot.cur_direction.must_equal :east
    end

    it 'can rotate 90 degress from west to north (index correctly moved to start of direction array)' do
       @robot.place(1,1,:west, @table)
       @robot.rotate(:right)

       @robot.cur_x.must_equal 1
       @robot.cur_y.must_equal 1
       @robot.cur_direction.must_equal :north
    end

    it 'can rotate 90 degress from north to west (index correctly moved to end of direction array)' do
       @robot.place(1,1,:north, @table)
       @robot.rotate(:left)

       @robot.cur_x.must_equal 1
       @robot.cur_y.must_equal 1
       @robot.cur_direction.must_equal :west
    end

    it 'can rotate right' do
       @robot.place(1,1,:north, @table)

       assert_raises(RotateError) { @robot.rotate(:up) }
    end

  end

end
