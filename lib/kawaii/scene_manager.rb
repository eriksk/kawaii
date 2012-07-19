module Kawaii
	class SceneManager
		attr_accessor :game, :scene

		def initialize game
			@game = game
			@states = [:run, :transition_in, :transition_out, :stopped]
			@on_scene_activated = []
			@current = 0.0
			set_state(:stopped)
		end

		# switches to a new scene and loads it
		def push_scene scene
			@scene = scene
			set_state(:transition_in)
		end

		# removes the current scene
		def pop_scene
			set_state(:stopped)
		end

		def on_scene_activated(lmbda)
			@on_scene_activated << lmbda
		end

		def update dt
			case @state
				when :run
					if @scene
						@scene.update dt
					end
				when :transition_in
					@current += dt
					if @scene
						@scene.transition_in @current, @scene.transition_duration
						if @current > @scene.transition_duration
							set_state(:run)
						end
					else
						set_state(:stopped)
					end
				when :transition_out
					if @scene
						@scene.transition_out @current, @scene.transition_duration
						if @current > @scene.transition_duration
							set_state(:run)
						end
					else
						set_state(:stopped)
					end
					
				when :stopped
				else
			end	
		end

		def draw
			if @scene
				@scene.draw
			end
		end

		private
			def set_state state
				@state = state	
				@current = 0.0
				case @state
					when :run
						@on_scene_activated.each do |callback|
							callback.call()
						end
						@on_scene_activated.clear
					when :transition_in
					when :transition_out
					when :stopped
						@scene = nil
					else
				end		
			end
	end
end