require_relative 'grid'
require_relative 'robot'
require_relative 'constants'
require_relative 'robot_view'

class Simulator
  include Constants
  def initialize(grid_length, grid_width)
    @grid = Grid.new(grid_length, grid_width)
    
    @robot = Robot.new    
    @grid.add_robot(@robot)
    
    @robot_view = RobotView.new(@robot)
  end
  
  def command(command_statement)
    command_executed = false
    command, arguments = extract_command(command_statement)    
   
    if command.casecmp('REPORT') == 0
      @robot_view.show
      return true
    end

    return command_executed if command.nil? || !@robot.methods.include?(command.downcase.to_sym)
    
    if arguments.nil?
      command_executed = @robot.method(command.downcase).call()
    else
      command_executed = @robot.method(command.downcase).call(arguments)
    end
    
    command_executed
  end
  
  private
  def extract_command(command_statement)
    command_array = command_statement.split(COMMAND_SEPERATOR)
    command_array
  end
end
