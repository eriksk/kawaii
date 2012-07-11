module Kawaii
	class TmxLayer

		attr_accessor :data, :name, :opacity, :width, :height, :x, :y

		def initialize hash
			@data = []
			hash['data'].each{|cell| @data.push cell}
			@name = hash['name']
			@opacity = hash['opacity']
			@width = hash['width']
			@height = hash['height']
			@x = hash['x']
			@y = hash['y']
		end

		def get_cell col, row
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
	end
end