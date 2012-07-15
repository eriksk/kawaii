require 'gosu'

module Kawaii
  class Game < Gosu::Window
  
    attr_accessor :width, :height, :fullscreen, :show_fps, :font, :node_manager, :content_manager, :physics_manager
  
    def initialize width = 800, height = 600, fullscreen = false, content_root = "content", debug = true
      super width, height, fullscreen
      @width, @height, @fullscreen = width, height, fullscreen    
      
      # managers
      @node_manager = Kawaii::NodeManager.new
      @content_manager = Kawaii::ContentManager.new(self, content_root)  
      @audio_manager = Kawaii::AudioManager.new(self)
      @input_manager = Kawaii::InputManager.new(self)
      @physics_manager = Kawaii::PhysicsManager.new

      # cam
      @cam = Kawaii::Camera.new(self)

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
      @node_manager.nodes.push node
    end
    
    def remove_child node
      @node_manager.nodes.delete node
    end
    
    def print_stats
      puts "Statistics:"
      puts "Nodes: #{node_manager.count}"
    end
    
    def update
      if self.class.method_defined? :before_update
        before_update
      end

      @dt = delta()
      @node_manager.update @dt

      if self.class.method_defined? :after_update
        after_update
      end
    end
  
    def delta
      16.0 # TODO: real delta
    end
    
    def get_fps
      1000.0 / delta
    end
  
    def before_draw
    end

    def after_draw
    end
    
    def draw_hud
    end

    def draw
      draw_quad(
        0, 0, @top_color,
        @width, 0, @top_color,
        @width, @height, @bottom_color,
        0, @height, @bottom_color,
      )
      @cam.translate do 
        before_draw
        @node_manager.draw  
        after_draw
      end
      
      draw_hud
      if @debug
          @font.draw("FPS: #{get_fps}", 14, 14, 0)
      end
    end 
  end
end