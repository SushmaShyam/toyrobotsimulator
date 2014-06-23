require_relative 'position'
require_relative 'grid'
require_relative 'constants'

class Robot
  include Constants
  attr_writer :grid
  attr_reader :position, :direction
  def initialize
    @position = nil
    @direction = nil
  end
  def place(argument_string)
    arguments = argument_string.split(ARGUMENT_SEPERATOR)
    return false unless arguments.count == 3 
    position = Position.new( arguments[0].to_i, arguments[1].to_i)
    direction = arguments[2].to_sym
    return false unless @grid.valid_position?( position) && DIRECTIONS.include?( direction)
    @position = position
    @direction = direction
    return true
  end
  
  def move
    return_value = true
    case @direction
      when (:E)
        new_position = Position.new( @position.x+1, @position.y)        
      when (:W)
        new_position = Position.new( @position.x-1, @position.y)
      when (:N)
        new_position = Position.new( @position.x, @position.y+1)
      when (:S)
        new_position = Position.new( @position.x, @position.y-1)
      else
        return_value = false  
    end
    if return_value && @grid.valid_position?( new_position)
      @position = new_position
      return true
    else
      return false
    end
  end
  
  def left
    return false if @direction.nil?
    current_index = DIRECTIONS.index( @direction)  
     
    if current_index > 0
      @direction = DIRECTIONS[current_index-1]
    else
      @direction = DIRECTIONS.last
    end
    return true
  end
  
  def right
    return false if @direction.nil?
    current_index = DIRECTIONS.index( @direction)  
     
    if current_index < DIRECTIONS.size - 1
      @direction = DIRECTIONS[current_index+1]
    else
      @direction = DIRECTIONS.last
    end    
    return true
  end
end