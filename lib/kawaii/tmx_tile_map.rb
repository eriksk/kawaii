module Kawaii
	class TmxTileMap

		attr_accessor :grid, :width, :height, :cell_size

		def initialize
			@grid = []
			@cell_size = Kawaii::DEFAULT_CELL_SIZE
		end

		def get_cell col, row
			@grid[col + row * width]
		end

		def draw
			
		end
	end
end