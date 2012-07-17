require 'chipmunk'

module Kawaii
	class PhysicsManager

		attr_accessor :space, :entities
		
		SUBSTEPS = 10

		def initialize
			@space = CP::Space.new
		    @space.gravity = CP::Vec2.new(0, 0.00001)
			@entities = []
		end

		def add_physics_entity entity
			puts "Adding: #{entity}"
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
		    	@entities.each do |entity|
		    		entity.body.reset_forces
		    	end
		    	@space.step(dt)
		    end
		end
	end
end