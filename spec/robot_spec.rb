require_relative 'spec_helper'
require_relative '../src/robot'
describe "Robot" do
  it "creates a robot" do
    expect(Robot.new).to_not be(nil)
  end
  before(:all) do
    @robot = Robot.new
    @robot_not_placed = Robot.new
    @grid = Grid.new(5,5)
    @grid.add_robot(@robot)
    @grid.add_robot(@robot_not_placed)
  end
  context "before a robot is placed on a grid" do
    it "has nil default position" , :turn1 => true do
      expect(@robot_not_placed.position).to eq(nil)
    end
    it "has nil default direction" do
      expect(@robot_not_placed.direction).to eq(nil)
    end
    it "does not move" do
      expect(@robot_not_placed.move).to eq(false)  
    end
    it "does not turn left" do
      expect(@robot_not_placed.left).to eq(false)    
    end
    it "does not turn right" do
      expect(@robot_not_placed.right).to eq(false)    
    end  
  end
  it "places the robot at the correct position" do
    @robot.place("3,4,E")
    expect(@robot.position.x == 3 && @robot.position.y == 4).to eq(true)    
  end
  it "places the robot at the correct direction" do
    @robot.place("3,4,E")
    expect(@robot.direction).to eq(:E)    
  end
  it "rejects invalid direction" do
    expect(@robot.place("3,4,NE")).to eq(false)
  end
  context "after being placed" do
    it "moves one step" do
      @robot.place("0,0,N")
      @robot.move
      expect(@robot.position.x == 0 && @robot.position.y == 1).to eq(true)
    end    
    it "turns left" do
      @robot.place("3,0,E")
      @robot.left
      expect(@robot.direction).to eq(:N)
    end
    it "turns right" do
      @robot.place("3,4,S")
      @robot.right
      expect(@robot.direction).to eq(:W)
    end
    it "does not move outside the grid from the right top corner" do
      @robot.place("4,4,N")
      expect(@robot.move).to be false
    end
    it "does not move outside the grid from the origin" do
      @robot.place("0,0,S")
      expect(@robot.move).to be false
    end
    
  end

end
