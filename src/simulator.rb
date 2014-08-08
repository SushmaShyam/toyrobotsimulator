require_relative 'grid'
require_relative 'robot'
require_relative 'directive'
require_relative 'robot_view'

class Simulator
  def initialize(grid_length, grid_width)
    @grid = Grid.new(grid_length, grid_width)    
    @robot = Robot.new(@grid)    
    @robot_view = RobotView.new(@robot)
    @robot.set_view(@robot_view)
  end
  
  def command(directive)
    @robot.public_send(directive.command, *directive.arguments)
  end    
end
