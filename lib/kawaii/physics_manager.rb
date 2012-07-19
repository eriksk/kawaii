require 'chipmunk'

module Kawaii
	class PhysicsManager

		attr_accessor :space, :entities
		
		SUBSTEPS = 10

		def initialize
			@space = CP::Space.new
		    @space.gravity = CP::Vec2.new(0, 5)
			@entities = []
		end

		def add_static_physics_entity entity
			if entity.class == PhysicsEntity
				@entities.push entity
				entity.add_static_to_space @space
			else
				raise WrongTypeError, "Only PhysicsEntity and derivatives are accepted"
			end 
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

		def update dt
		    SUBSTEPS.times do		    	
		    	@space.step(dt / 1000.0)
		    	@entities.each do |entity|
		    		entity.body.reset_forces
		    	end
		    end
		end
	end
end