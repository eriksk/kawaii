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

		protected
			def create_circle radius
				puts "Creating circle with r:#{radius}"
			end

			def create_rectangle width, height
				puts "Creating rectangle with w:#{width} and h:#{height}"
			end
	end
end