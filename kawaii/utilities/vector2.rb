require_relative 'kawaii'

class Kawaii::Vector2
  
  attr_accessor :x, :y
  
  def initialize
    @x, @y = 0, 0
  end
  
  def initialize x, y
    @x, @y = x, y
  end
  
  # TODO: helpers
  def normalize
  end
  
  def length
  end
  
  def direction
  end
end