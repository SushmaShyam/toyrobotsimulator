require_relative 'position'
require_relative 'grid'

class Robot
  attr_reader :position, :direction
  DIRECTIONS = [:E , :S, :W, :N]
  
  def initialize(grid)
    @position = nil
    @direction = nil
    @grid = grid
  end
  
  def set_view(view)
    @view = view
  end
  
  def report
    @view.show
  end
  
  def jump
    position = nil 
  end
  
  def place(x,y,direction)
    position = Position.new(x,y)
    return false unless @grid.valid_position?(position) && DIRECTIONS.include?(direction)
    
    @position = position
    @direction = direction    
    true
  end
  
  def next_position
    next_x = @position.x
    next_y = @position.y
    case @direction
      when (:E)
        next_x += 1      
      when (:W)
        next_x -= 1
      when (:N)
        next_y += 1
      when (:S)
        next_y -= 1 
    end
    next_position = Position.new(next_x, next_y)
  end

  def move
    return false if @direction.nil?
    new_position = next_position
    if @grid.valid_position?(new_position)
      @position = new_position
      moved = true
    else
      moved = false
    end
    moved
  end
  
  def left
    return false if @direction.nil?
    
    current_index = DIRECTIONS.index(@direction)  
     
    if current_index > 0
      @direction = DIRECTIONS[current_index-1]
    else
      @direction = DIRECTIONS.last
    end
    
    true
  end
  
  def right
    return false if @direction.nil?
    
    current_index = DIRECTIONS.index(@direction)  
     
    if current_index < DIRECTIONS.size - 1
      @direction = DIRECTIONS[current_index+1]
    else
      @direction = DIRECTIONS.last
    end    
    
    true
  end
end
