require 'json'

module Kawaii
	class TmxTileMap

		attr_accessor :layers, :width, :height, :tile_width, :tile_height, :properties, :orientation, :texture

		def initialize
			@layers = []
			@properties = {}
			@tilesets = []
		end

		def draw
			#@layers.each do |layer|
				@layers.last.draw
			#end
		end

		def load path, content_manager
			if path.end_with? ".json"
				load_json path
				@layers.each do |layer|
					layer.textures = content_manager.load_tiled_images(@tilesets.first.gsub(/\.\.\//, ""), 32) # TODO: don't hard code cell size
				end
			else
				raise UnsupportedFormatError, "only json is supported"
			end
		end

		def to_s
			puts "Width: #{@width}"
			puts "Height: #{@height}"
			puts "Orientation: #{@orientation}"
			puts "Tile width: #{@tile_width}"
			puts "Tile height: #{@tile_height}"
			puts ""
			puts "Properties"
			properties.each do |k, v|
				puts "Key: #{k}, Value: #{v}"
			end

			puts ""
			puts "Layers: "
			@layers.each do |l|
				puts l.to_s
			end
		end

		protected
			def load_json path
				File.open(path) do |f|
					populate JSON.parse(f.read)
				end
			end

			def populate hash
				@width = hash['width']
				@height = hash['height']
				@tile_width = hash['tilewidth']
				@tile_height = hash['tileheight']
				@orientation = hash['orientation']
				hash['layers'].each do |layer|
					@layers.push TmxLayer.new layer
				end
				hash['properties'].each do |property|
					@properties[property['key']] = property['value']
				end
				hash['tilesets'].each do|tileset|
					@tilesets.push tileset['image']
				end
			end
	end
end