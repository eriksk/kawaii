require_relative 'kawaii'
require 'gosu'

class Kawaii::ContentManager

  attr_accessor :root, :images
  
  def initialize window, root
    @window = window
    @root = root
    @images = {}
  end
  
  def load_image(path)
    images[path] = Gosu::Image.new(@window, @root + path, false) # TODO: tileable images
  end
end