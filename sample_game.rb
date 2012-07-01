require_relative 'lib/kawaii.rb'

class Game < Kawaii::Game
  
  WIDTH = 800
  HEIGHT = 600
  FULLSCREEN = false
  CONTENT_ROOT = "content"
  
  def initialize
    super WIDTH, HEIGHT, FULLSCREEN, CONTENT_ROOT
    self.caption = "My sample game"
    self.show_fps = true
    load_game
  end
  
  def load_game
    enemies = Kawaii::Node.new
    50.times do |i|
      enemies.add_node Kawaii::Entity.new @content_manager.load_image "gfx/ball.png"
    end
    add_node enemies
    add_node Kawaii::Entity.new @content_manager.load_image "gfx/ball.png" # player
    print_stats
  end
  
  def input
    if button_down?Gosu::KbEscape
      exit
    end
  end

  def update_game
    input    
  end
end

game = Game.new
game.show