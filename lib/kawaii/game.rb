require 'gosu'

module Kawaii
  class Game < Gosu::Window
  
    def initialize width, height, fullscreen
      super width, height, fullscreen
      @width, @height, @fullscreen = width, height, fullscreen
      @bg_color = Gosu::Color::BLUE
    end
    
    def update
      @dt = delta()
    end
  
    def delta
    end
  
    def draw
      draw_quad(
        0, 0, @bg_color,
        @width, 0, @bg_color,
        @width, @height, @bg_color,
        0, @height, @bg_color,
      )
    end 
  end
end