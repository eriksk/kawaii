require 'chipmunk'

module Kawaii
	class PhysicsEntity < Entity
		
		attr_accessor :shape, :body, :geom

		def initialize geom, args
			@geom = geom
			case geom
				when :circle
					create_circle(args[:radius])
				when :rectangle
					create_rectangle(args[:width], args[:height])
			end
		end

		def add_to_space chipmunk_space
			# TODO: check if body is static etc...
		end

		def remove_from_space chipmunk_space
		end

		protected
			def create_circle radius
			end

			def create_rectangle width, height
			end
	end
end