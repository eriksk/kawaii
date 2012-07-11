require 'gosu'

module Kawaii
  class Game < Gosu::Window
  
    attr_accessor :width, :height, :fullscreen, :show_fps, :font, :node_manager, :content_manager
  
    def initialize width, height, fullscreen, content_root, debug = true
      super width, height, fullscreen
      @width, @height, @fullscreen = width, height, fullscreen    
      
      # managers
      @node_manager = Kawaii::NodeManager.new
      @content_manager = Kawaii::ContentManager.new(self, content_root)  
      @audio_manager = Kawaii::AudioManager.new(self)
      @input_manager

      # stats
      @top_color = Gosu::Color.new(0xFF1EB1FA)
      @bottom_color = Gosu::Color.new(0xFF1D4DB5)
      @font = Gosu::Font.new(self, Gosu::default_font_name, 18)
      @debug = debug
      
      if @debug
        puts "Game settings:"
        puts "\tResolution: #{width}:#{height}"
        puts "\tFullscreen: #{fullscreen}"
        puts "\tContent root: #{content_root}"
        print_stats
      end
    end
    
    def add_child node
      @node_manager.add_node node
    end
    
    def remove_child node
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
      1000.0 / delta
    end
  
    def draw
      draw_quad(
        0, 0, @top_color,
        @width, 0, @top_color,
        @width, @height, @bottom_color,
        0, @height, @bottom_color,
      )
      @node_manager.draw
      if @debug
        @font.draw("FPS: #{get_fps}", 14, 14, 0)
      end
    end 
  end
end