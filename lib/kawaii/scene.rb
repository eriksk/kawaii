module Kawaii
	class Scene
		attr_accessor :name, :scene_manager

		def initialize scene_manager
			@scene_manager = scene_manager
		end

		def transition_in current, duration
		end

		def transition_out current, duration
		end

		def update dt
		end

		def draw
		end
	end
end