require 'gosu'

module Kawaii
  class Game < Gosu::Window
  
    attr_accessor :width, :height, :fullscreen, :show_fps, :font, :node_manager, :content_manager
  
    def initialize width, height, fullscreen, content_root
      super width, height, fullscreen
      @width, @height, @fullscreen = width, height, fullscreen    
      @node_manager = Kawaii::NodeManager.new(self)
      @content_manager = Kawaii::ContentManager.new(self, content_root)  
      @top_color = Gosu::Color.new(0xFF1EB1FA)
      @bottom_color = Gosu::Color.new(0xFF1D4DB5)
      @font = Gosu::Font.new(self, Gosu::default_font_name, 18)
      @show_fps = true
      
      puts "Starting game with settings:"
      puts "\tResolution: #{width}:#{height}"
      puts "\tFullscreen: #{fullscreen}"
      puts "\tContent root: #{content_root}"
    end
    
    def add_node node
      @node_manager.add_node node
    end
    
    def remove_node node
      @node_manager.remove_node node
    end
    
    def print_stats
      puts "Statistics:"
      puts "Nodes: #{node_manager.count}"
    end
    
    def update
      @dt = delta()
      @node_manager.update @dt
      update_game
    end
  
    def delta
      16.0 # TODO: real delta
    end
    
    def get_fps
      "60" # TODO: real fps, fix delta
    end
  
    def draw
      draw_quad(
        0, 0, @top_color,
        @width, 0, @top_color,
        @width, @height, @bottom_color,
        0, @height, @bottom_color,
      )
      @node_manager.draw
      if @show_fps
        @font.draw("FPS: #{get_fps}", 14, 14, 0)
      end
    end 
  end
end