module Kawaii
	class SceneManager
		attr_accessor :game, :scene

		def initialize game, scene = nil
			@game = game
			@scene = scene
			@old_scene = nil
			@current_transition = 0.0
			@state = :none
			@state = :transition if @scene != nil
			@on_scene_activated = []
		end

		# switches to a new scene and loads it
		def push_scene scene
			@old_scene = @scene
			@scene = scene		
			@scene.load
			@current_transition = 0.0
			@state = :transition
		end

		# removes the current scene
		def pop_scene
			@state = :none
			@old_scene = nil
			@scene = nil
		end

		def on_scene_activated(lmbda)
			@on_scene_activated << lmbda
		end

		def update dt
			case @state
				when :none
					@scene.update dt
				when :transition
					if @scene != nil
						@scene.transition_in @current_transition, @scene.transition_duration
					end
					if @old_scene != nil
						@old_scene.transition_out @current_transition, @old_scene.transition_duration
					end

					@current_transition += dt
					if @current_transition > @scene.transition_duration
						@state = :transition_done
						@current_transition = 0.0
						@on_scene_activated.each do |l|
							l.call()
						end
						# remove jobs
						@on_scene_activated.clear
					end
				when :transition_done
					@current_transition = 0.0
					@old_scene = nil
					@state = :none
				else
			end
		end

		def draw
			if @old_scene != nil
				@old_scene.draw
			end
			if @scene != nil
				@scene.draw
			end
		end
	end
end