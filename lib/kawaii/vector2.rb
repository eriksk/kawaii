module Kawaii
  class Vector2
  
    attr_accessor :x, :y
  
    def initialize x = 0, y = 0
      @x, @y = x, y
    end
  
    def normalize
      # TODO: helpers
    end
  
    def length
      Math::sqrt(x * y)
    end
  
    def direction
      Math::atan2(y, x)
    end
  end   
end