module Kawaii
	class TmxLayer

		attr_accessor :data, :name, :opacity, :width, :height, :x, :y, :textures

		def initialize hash
			@data = []
			hash['data'].each{|cell| @data.push cell}
			@name = hash['name']
			@opacity = hash['opacity']
			@width = hash['width']
			@height = hash['height']
			@x = hash['x']
			@y = hash['y']
			@textures = nil
		end

		def get_cell col, row
			#puts "Getting cell w col:#{col} and row: #{row} and it has the value #{@data[col + row * @width]}"
			#puts @data
			@data[col + row * @width]
		end

		def to_s
			puts "Name: #{name}"
			puts "Opacity: #{opacity}"
			puts "Width: #{width}"
			puts "Height: #{height}"
			puts "X: #{x}"
			puts "Y: #{y}"
		end

		def draw
			@width.times do |i|
				@height.times do |j|
					cell = get_cell(i, j)
					if(cell != 0)
						@textures[cell-1].draw(i * 32, j * 32, 0)
					end
				end
			end
		end
	end
end