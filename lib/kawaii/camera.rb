module Kawaii
	class Camera
		
		def initialize game
			@game = game
			@pos = Vector2.new
			@origin = Vector2.new(@game.width / 2, @game.height / 2)
			@destination = Vector2.new
			@speed = 0.05
		end

		def move x, y
			@destination.x, @destination.y = x - @origin.x, y - @origin.y
			@pos.x = Kawaii::lerp(@pos.x, @destination.x, @speed)
			@pos.y = Kawaii::lerp(@pos.y, @destination.y, @speed)	
		end

		def translate(&block)
			@game.translate(@pos.x, @pos.y) do
				block.call()
			end
		end
	end
end