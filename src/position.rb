class Position
  attr_accessor :x
  attr_accessor :y
  
  def initialize(x,y)
    @x = x
    @y = y
  end
  
  def to_s
    return "(#@x, #@y)"
  end
end
