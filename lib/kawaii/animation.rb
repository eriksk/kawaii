module Kawaii
	class Animation < Entity

		def initialize textures, frames = [], interval = 1000.0, loop = true
			super(textures)

			@frames = frames
			@interval = interval
			@current = 0.0
			@loop = loop
			@current_frame = 0
			@times_run = 0

			add_update_hook(lambda{ |dt| update_frames(dt) })
		end

		def update_frames dt
			if @loop || (!@loop && @times_run < 1)
				@current += dt
				if @current >= @interval
					@current = 0
					@current_frame += 1
					if @current_frame > @frames.size - 1
						@current_frame = 0
						@times_run += 1
						if !@loop
							@current_frame = @frames.size - 1
						end
					end
				end
			end
		end

		def draw
	      	# TODO: draw flipped v & h
	      	@texture[@frames[@current_frame]].draw_rot(@position.x, @position.y, 0, 0) # TODO: rotation
  		end
	end
end