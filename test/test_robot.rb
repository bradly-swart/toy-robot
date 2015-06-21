require './test/test_helper'
require './robot'
require 'pry'

describe Robot do
  before do
    @robot = Robot.new
  end

  describe "Placing robot" do
    it "is placed with correct coordinates" do
      @robot.place("1","2","NORTH")

      @robot.cur_x.must_equal "1"
      @robot.cur_y.must_equal "2"
      @robot.cur_direction.must_equal 'NORTH'
      assert @robot.placed?
    end

    it 'cannot be placed outside of the table' do
      @robot.place("-1","-1","NORTH")
      assert_equal @robot.placed? false
    end
  end
end
