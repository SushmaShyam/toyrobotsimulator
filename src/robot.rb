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
  
  def place(x,y,direction)
    position = Position.new(x,y)
    return false unless @grid.valid_position?(position) && DIRECTIONS.include?(direction)
    
    @position = position
    @direction = direction    
    true
  end
  
  def move
    moved = true
    
    case @direction
      when (:E)
        new_position = Position.new(@position.x+1, @position.y)        
      when (:W)
        new_position = Position.new(@position.x-1, @position.y)
      when (:N)
        new_position = Position.new(@position.x, @position.y+1)
      when (:S)
        new_position = Position.new(@position.x, @position.y-1)
      else
        moved = false  
    end
    
    if moved && @grid.valid_position?(new_position)
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
