require 'gosu'
require 'yaml'

module Kawaii
  class Game < Gosu::Window
  
    CONFIG_PATH = File.expand_path(".") +'/config.yml'
    CONFIG = YAML.load_file(CONFIG_PATH) if File.exist?(CONFIG_PATH)

    attr_accessor :width, :height, :fullscreen, :show_fps, :font, :content_root
      
    def initialize
      super CONFIG['resolution']['width'], CONFIG['resolution']['height'], CONFIG['fullscreen'], CONFIG['target_fps'] == 0 ? 0 : 1000.0 / CONFIG['target_fps'] 
      @width, @height, @fullscreen = CONFIG['resolution']['width'], CONFIG['resolution']['height'], CONFIG['fullscreen']
      @content_root = CONFIG['content_root']
      
      @scene_manager = Kawaii::SceneManager.new(self) 
      # load intro scene
      @scene_manager.push_scene Kawaii::Intro.new @scene_manager

      # stats
      @top_color = Gosu::Color::WHITE
      @bottom_color = Gosu::Color::WHITE
      @font = Gosu::Font.new(self, Gosu::default_font_name, 18)
      @debug = CONFIG['debug']
      
      # logging
      if @debug
        puts "Game settings:"
        puts "\tResolution: #{width}:#{height}"
        puts "\tFullscreen: #{fullscreen}"
        puts "\tContent root: #{content_root}"
        puts "\tTarget fps: #{CONFIG['target_fps']}"
      end

      # timing
      @time_to_update_fps = 0
      @fps = 0
    end
     
    def before_update
    end
    def after_update
    end

    private
      def update
        update_delta()
        before_update()
        @scene_manager.update @dt
        @time_to_update_fps -= @dt
        after_update()
      end

      def update_delta
        # init it the first time, if loading takes to long
        if !@this_frame
          @last_frame = Gosu::milliseconds
        end
        @this_frame = Gosu::milliseconds
        @dt = (@this_frame - @last_frame)
        @last_frame = @this_frame
      end
      
      def get_fps
        (1000.0 / @dt).to_i
      end
    
      def draw
        draw_quad(
          0, 0, @top_color,
          @width, 0, @top_color,
          @width, @height, @bottom_color,
          0, @height, @bottom_color,
        )
        @scene_manager.draw
        # update fps string once every second
        if  @time_to_update_fps < 0
            @time_to_update_fps = 1000
            @fps = get_fps
        end
        if @debug
            @font.draw("FPS: #{@fps}", 16, 16, 0)
        end
      end 
  end
end