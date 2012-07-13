require '../../lib/kawaii'
require_relative 'enemy'

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
    @tile_map = Kawaii::TmxTileMap.new
    @tile_map.load "content/maps/map1.json", @content_manager

    enemies = Kawaii::Node.new
    enemy_count = 20
    enemy_count.times do |i|
      enemy = Enemy.new @content_manager.load_image "gfx/ball.png"
      enemy.position.x = Kawaii::lerp(0, WIDTH, i / enemy_count.to_f) + 32
      enemies.add_child enemy
    end
    add_child enemies
    add_child Kawaii::Entity.new @content_manager.load_image "gfx/ball.png" # player
    print_stats
  end
  
  def input
    if button_down? Gosu::KbEscape
      exit
    end
  end

  def update_game
    input    
  end

  def before_draw
    @tile_map.draw
  end
end

game = Game.new
game.show