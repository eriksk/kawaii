require 'gosu'

module Kawaii
  class TextField
    attr_accessor :font, :text, :position
    
    def initialize font, position = Kawaii::Vector2.new, text = ""
    # TODO: complete
      @font, @position, @text = font, position, text
    end
    
    def set_text text
      @text = text
      # TODO: complete
    end
    
    def draw
    # TODO: complete
      @font.draw(@position.x, @position.y, 0)
    end
  end
end