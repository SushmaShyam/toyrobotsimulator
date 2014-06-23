class Grid
  def initialize(length, width)
    raise ArgumentError.new() if (length <=0 || width <=0)
    @length = length
    @width = width
  end
  
  def add_robot(robot)
    @robot = robot
    @robot.grid = self
  end
  
  def valid_position?(position)
    (position.x < @length && position.x >= 0 && position.y < @width && position.y >= 0) 
  end
end
