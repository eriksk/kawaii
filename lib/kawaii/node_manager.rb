
module Kawaii
  class NodeManager
  
    attr_accessor :nodes
  
    def initialize
      @nodes = []
    end
    
    def count
      sum = 0
      nodes.each do |node|
        sum += node.count
      end
      sum
    end
    
    def update dt
      nodes.each do |node|
        node.update dt
      end
    end
    
    def draw
      nodes.each do |node|
        node.draw
      end
    end
  
    def clear
      nodes.clear
    end
  end   
end