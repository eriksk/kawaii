require 'gosu'

module Kawaii
  class Game < Gosu::Window
  
    attr_accessor :width, :height, :fullscreen, :show_fps, :font, :content_root
  
    def initialize width = 800, height = 600, fullscreen = false, content_root = "content", debug = true
      super width, height, fullscreen
      @width, @height, @fullscreen = width, height, fullscreen    
      @content_root = content_root
      
      @scene_manager = Kawaii::SceneManager.new(self) 
      # load intro scene
      @scene_manager.push_scene Kawaii::Intro.new @scene_manager

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
      end
    end
  
    def update
      before_update()
      @dt = delta()
      @scene_manager.update @dt
    end
    
    def before_update
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
      @scene_manager.draw
      if @debug
          @font.draw("FPS: #{get_fps}", 14, 14, 0)
      end
    end 
  end
end