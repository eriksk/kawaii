require 'chipmunk'

module Kawaii
	class PhysicsManager

		attr_accessor :space, :entities

		def initialize
			@space = CP::Space.new
			@entities = []
		end

		def add_physics_entity entity
			if entity.class == PhysicsEntity
				@entities.push entity
				entity.add_to_space @space
			else
				raise WrongTypeError, "Only PhysicsEntity and derivatives are accepted"
			end 
		end

		def remove_physics_entity entity
			@entities.delete entity
			entity.remove_from_space @space
		end
	end
end