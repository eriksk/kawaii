module Kawaii
  class Vector2
  
    attr_accessor :x, :y
  
    def initialize x = 0, y = 0
      @x, @y = x, y
    end
  
    def normalize
      length = Math::sqrt((@x * @x) + (@y * @y))
      if (length != 0)
          @x = @x / length
          @y = @y / length
      end
    end
  
    def length
      Math::sqrt((@x * @x) + (@y * @y))
    end
  
    def direction
      Math::atan2(y, x)
    end
  end   
end