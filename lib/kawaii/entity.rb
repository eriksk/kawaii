require_relative 'node'

module Kawaii
  class Entity < Node
  
    attr_accessor :flipped_h, :flipped_v
  
    def initialize
      @flipped_v, @flipped_h = false, false
    end
  end            
end