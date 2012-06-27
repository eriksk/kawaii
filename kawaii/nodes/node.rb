require_relative 'kawaii'

class Kawaii::Node
  attr_accessor :position, :velocity, :children
  
  def initialize
    @children = []
    @position = Kawaii::Vector2.new()
    @velocity = Kawaii::Vector2.new()
  end
  
  def add_child node
    @children.push(node)
  end
  
  def remove_child node
    @children.remove(node)
  end
  
  def has_children?
    @children.size > 0
  end
  
  def update dt
  end
  
  def draw
  end
end