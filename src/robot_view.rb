class RobotView
  def initialize(robot)
    @robot = robot
  end
  def show
    if @robot.position.nil?
      puts "Robot yet to be placed on the grid"  
    else
      puts "robot is at position, #{@robot.position} and is facing #{@robot.direction}"
    end    
  end
end