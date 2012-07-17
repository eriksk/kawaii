module Kawaii
	class SceneManager
		attr_accessor :game, :scene

		def initialize game, scene = nil
			@game = game
			@scene = scene
			@next_scene = nil
			@current_transition = 0.0
			@state = :none
			@state = :transition_out if @scene != nil
			@on_scene_activated = []
		end

		# switches to a new scene and loads it
		def push_scene scene
			@next_scene = scene		
			@next_scene.load
			@current_transition = 0.0
			@state = :transition_out
		end

		# removes the current scene
		def pop_scene
			@state = :none
			@next_scene = nil
			@scene = nil
		end

		def on_scene_activated(lmbda)
			@on_scene_activated << lmbda
		end

		def update dt
			case @state
				when :none
					if @scene
						@scene.update dt
					end
				when :transition_in
					if @scene
						@scene.transition_in @current_transition, @scene.transition_duration
					end
					@current_transition += dt
					if @current_transition > @scene.transition_duration
						on_transitioned_in()
					end
				when :transition_out
					if @scene
						@scene.transition_out @current_transition, @scene.transition_duration
						@current_transition += dt
						if @current_transition > @scene.transition_duration
							on_transitioned_out()
						end
					else
						on_no_scene()
					end
				else
			end
		end

		def draw
			if @scene
				@scene.draw
			end
		end

		private
			def goto_next_scene
				@scene = @next_scene
				@next_scene = nil
			end

			def on_transitioned_in
				@state = :none
				@current_transition = 0.0
				@on_scene_activated.each do |l|
					l.call()
				end
				# remove jobs
				@on_scene_activated.clear
			end

			def on_transitioned_out
				goto_next_scene()
				@current_transition = 0.0
				@state = :transition_in
			end

			def on_no_scene
				# no old scene, go directly to the new scene
				@current_transition = 0.0
				@state = :transition_in
				goto_next_scene()
			end
	end
end