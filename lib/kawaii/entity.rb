require_relative 'node'

module Kawaii
  class Entity < Kawaii::Node
  
    attr_accessor :flipped_h, :flipped_v
  
    def initialize texture
      super()
      @flipped_v, @flipped_h = false, false
      @texture = texture
    end
    
    def update dt
    end

    def draw
      @texture.draw_rot(self.position.x, self.position.y, 0, 0) # TODO: rotation
    end
  end            
end