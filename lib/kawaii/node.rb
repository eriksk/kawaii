
module Kawaii
  class Node
    attr_accessor :position, :velocity, :rotation, :gravity, :static, :children
  
    def initialize static = false, position = Vector2.new, velocity = Vector2.new, gravity = Kawaii::Vector2.new(0, Kawaii::GRAVITY)
      @children = []
      @rotation = 0.0
      @position = position
      @velocity = velocity
      @gravity = gravity
      @static = static
      @update_hooks = []
    end
    
    def count
      sum = 1
      @children.each do |child|
        sum += child.count 
      end
      sum
    end
  
    def add_child node
      @children.push(node)
    end
  
    def remove_child node
      @children.delete(node)
    end
  
    def has_children?
      @children.size > 0
    end

    # adds a lambda to be called on every update
    # dt is passed as a parameter
    def add_update_hook(lmbda)
      @update_hooks << lmbda
    end
  
    def update dt
      if self.class.method_defined? :before_update
        before_update dt
      end

      if !@static
        @velocity.x += @gravity.x * dt
        @velocity.y += @gravity.y * dt
        @position.x += @velocity.x * dt
        @position.y += @velocity.y * dt  
      end
      
      @children.each do |child|
        child.update dt
      end

      if self.class.method_defined? :after_update
        after_update dt
      end

      @update_hooks.each do |hook|
        hook.call(dt)
      end
    end
  
    def draw
      @children.each do |child|
        child.draw
      end
    end
  end
end