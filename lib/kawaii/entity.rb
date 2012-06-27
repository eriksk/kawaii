require_relative 'kawaii'
require_relative 'node'

class Kawaii::Entity < Kawaii::Node
  
  attr_accessor :flipped_h, :flipped_v
  
  def initialize
    @flipped_v, @flipped_h = false, false
  end
end