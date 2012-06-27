require_relative 'lib/kawaii.rb'

class Game < Kawaii::Game
  
  WIDTH = 800
  HEIGHT = 600
  FULLSCREEN = false
  
  def initialize
    super WIDTH, HEIGHT, FULLSCREEN
  end
  
  def update
    
    
  end
  
  def draw
  end
end

game = Game.new
game.show