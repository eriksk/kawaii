
module Kawaii
  class NodeManager
  
    attr_accessor :nodes
  
    def initialize game
      @game = game
      @nodes = []
    end
    
    def count
      sum = 0
      nodes.each do |node|
        sum += node.count
      end
      sum
    end
    
    def add_node node
      nodes.push node
    end
    
    def remove_node node
      nodes.remove node
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
  
    # TODO: settings in this class, like gravity and stuff. ? maybe individual node gravity? just a vector! could be cool.
  
    def clear
      nodes.clear
    end
  end   
end