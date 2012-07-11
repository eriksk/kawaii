require 'json'

module Kawaii
	class TmxTileMap

		attr_accessor :layers, :width, :height, :tile_width, :tile_height, :properties, :orientation, :texture

		def initialize
			@layers = []
			@properties = {}
		end

		def draw
		end

		def load path
			if path.end_with? ".json"
				load_json path
			elsif path.end_with? ".xml"
				load_xml path
			else
				raise UnsupportedFormatError, "only json and xml allowed"
			end
		end

		private
			def load_json path
				File.open(path) do |f|
					populate JSON.parse(f.read)
				end
			end

			def load_xml path
				File.open(path) do |f|
					populate XMl.parse(f.read)
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
			end
	end
end