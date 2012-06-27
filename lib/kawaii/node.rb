
module Kawaii
  class Node
    attr_accessor :position, :velocity, :rotation, :children
  
    def initialize
      @children = []
      @rotation = 0.0
      @position = Kawaii::Vector2.new
      @velocity = Kawaii::Vector2.new
    end
    
    def count
      sum = 1
      @children.each do |child|
        child.count 
      end
      sum
    end
  
    def add_node node
      @children.push(node)
    end
  
    def remove_node node
      @children.remove(node)
    end
  
    def has_children?
      @children.size > 0
    end
  
    def update dt
      @position.x += @velocity.x * dt
      @position.y += @velocity.y * dt
      @children.each do |child|
        child.update dt
      end
    end
  
    def draw
      @children.each do |child|
        child.draw
      end
    end
  end
end