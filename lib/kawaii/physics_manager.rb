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
			else
				raise WrongTypeError, "Only PhysicsEntity and derivatives are accepted"
			end 
		end
	end
end