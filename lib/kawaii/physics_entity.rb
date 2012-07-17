require 'chipmunk'

module Kawaii
	class PhysicsEntity < Entity
		
		attr_accessor :shape, :body, :geom

		def initialize texture, geom, args
			super(texture)
			@geom = geom
			case geom
				when :circle
					create_circle(args[:radius])
				when :rectangle
					create_rectangle(args[:width], args[:height])
			end
		end

		def physics
			true
		end

		def add_to_space chipmunk_space
			# TODO: check if body is static etc...

		    # WE ADD THE THE BODY AND SHAPE TO THE SPACE WHICH THEY WILL LIVE IN
		    chipmunk_space.add_body(@body)
		    chipmunk_space.add_shape(@shape)
		end

		def remove_from_space chipmunk_space
			# TODO: remove it
		end

		def draw
			@color = Gosu::red
			top_left, top_right, bottom_left, bottom_right = self.rotate
			$game.draw_quad(top_left.x, top_left.y, @color,
		                  top_right.x, top_right.y, @color,
		                  bottom_left.x, bottom_left.y, @color,
		                  bottom_right.x, bottom_right.y, @color, 1)
		end

		def rotate
			half_diagonal = Math.sqrt(2) * (32)
			[-45, +45, -135, +135].collect do |angle|
		   		CP::Vec2.new(@body.p.x + Gosu::offset_x(@body.a.radians_to_gosu + angle, half_diagonal),
			                 @body.p.y + Gosu::offset_y(@body.a.radians_to_gosu + angle,
		     				 half_diagonal))
		   	end

		end

		protected
			def create_circle radius
			end

			def create_rectangle width, height
				# mass & inertia
				@body = CP::Body.new(10, 100)
				# position
			    @body.p = CP::Vec2.new(0, 0)
			    # velocity
			    @body.v = CP::Vec2.new(0, 0)
			    # angle
			    @body.a = 0.0
			    
			    # TODO: height
			    shape_verts = [
			                    CP::Vec2.new(-width, width),
			                    CP::Vec2.new(width, width),
			                    CP::Vec2.new(width, -width),
			                    CP::Vec2.new(-width, -width),
			                   ]

			    @shape = CP::Shape::Poly.new(@body, shape_verts, CP::Vec2.new(0, 0))
			    
			    # elasticy
			    @shape.e = 0
			    # friction coefficient
			    @shape.u = 1 
			end
	end
end