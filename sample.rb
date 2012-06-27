require_relative 'lib/kawaii.rb'

class Game < Kawaii::Game
  
  WIDTH = 800
  HEIGHT = 600
  FULLSCREEN = false
  CONTENT_ROOT = "content"
  
  def initialize
    super WIDTH, HEIGHT, FULLSCREEN, CONTENT_ROOT
  end
  
  def update
    super_update
    if button_down?Gosu::KbEscape
      exit
    end  
  end
  
end

game = Game.new
game.show