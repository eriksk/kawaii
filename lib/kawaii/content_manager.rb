require 'gosu'

module Kawaii
  class ContentManager

    attr_accessor :root, :images
  
    def initialize window, root
      @window = window
      @root = root
      @images = {}
    end
    
    def clear
      @images.clear
    end
  
    # loads an image and caches it for further use
    # if an image has been loaded it is just being returned
    def load_image(path, tileable = false)
      if !@images[path]
        @images[path] = Gosu::Image.new(@window, "#{@root}/#{path}", tileable)
      end
      @images[path]
    end
  end
end