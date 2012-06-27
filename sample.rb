require_relative 'kawaii/kawaii.rb'
require_relative 'kawaii/game.rb'

class Game < Kawaii::Game
  
  WIDTH = 800
  HEIGHT = 600
  FULLSCREEN = false
  
  def initialize
    super WIDTH, HEIGHT, FULLSCREEN
  end
  
  def update
    super.update
    
  end
  
  def draw
  end
end

game = Game.new
game.show