module Kawaii
	class SceneManager
		attr_accessor :scene

		def initialize scene = nil
			@scene = scene
			@old_scene = nil
			@current_transition = 0.0
			@state = :none
			@state = :transition if @scene != nil
		end

		def push_scene scene
			@old_scene = @scene
			@scene = scene		
		end

		def update dt
			case @state
				when :none
				when :transition
					if @scene != nil
						@scene.transition_in @current_transition, SCENE_TRANSITION_DURATION
					end
					if @old_scene != nil
						@old_scene.transition_out @current_transition, SCENE_TRANSITION_DURATION
					end

					@current_transition += dt
					if @current_transition > SCENE_TRANSITION_DURATION
						@state = :transition_done
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