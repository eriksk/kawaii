require 'chipmunk'

module Kawaii
	class PhysicsEntity < Entity
		
		attr_accessor :shape, :body, :geom

		INFINITY = 1.0/0

		def initialize texture, geom, args, static = false
			super(texture)
			@geom = geom
			@static = static
			case geom
				when :circle
					create_circle(args[:radius])
				when :rectangle
					create_rectangle(args[:width], args[:height])
				when :polygon
					create_polygon(args[:vertices])
			end

			if @static
	  			@body.m = INFINITY
	  			@body.i = INFINITY
			end

			load
		end

		def load
		end

		def physics
			true
		end

		# gets the chipmunk physics space
		# returns nil if this body never have been added to 
		# the chipmunk physics space
		def space
			@space
		end

		def add_to_space chipmunk_space
		    if @static
		    	add_static_to_space chipmunk_space
		    else
		    	chipmunk_space.add_body(@body)
		    	chipmunk_space.add_shape(@shape)
		    end
		    @space = chipmunk_space
		end


		def add_static_to_space chipmunk_space
		    chipmunk_space.add_static_shape(@shape)
		end

		def remove_from_space chipmunk_space
			chipmunk_space.remove_body(@body)
			chipmunk_space.remove_shape(@shape)
		end

		def draw
			if @texture
				@texture.draw_rot(@body.p.x, @body.p.y, 0, @body.a.to_degrees)
			end
			#draw_debug
		end

		 def draw_debug
		 	@color = Gosu::Color::RED
		    top_left, top_right, bottom_left, bottom_right = self.rotate
		    $game.draw_quad(top_left.x, top_left.y, @color,
		                      top_right.x, top_right.y, @color,
		                      bottom_left.x, bottom_left.y, @color,
		                      bottom_right.x, bottom_right.y, @color, 1)
		  end
		  
		  def rotate
		    half_diagonal = Math.sqrt(2) * (16)
		    [-45, +45, -135, +135].collect do |angle|
		       CP::Vec2.new(@body.p.x + Gosu::offset_x(@body.a.radians_to_gosu + angle,
		                                               half_diagonal),
		                    @body.p.y + Gosu::offset_y(@body.a.radians_to_gosu + angle,
		                                               half_diagonal))

		    end
		  end

		protected
			def create_circle radius
				# mass & inertia
				@body = CP::Body.new(10, 100)
				# position
			    @body.p = CP::Vec2.new(0, 0)
			    # velocity
			    @body.v = CP::Vec2.new(0, 0)
			    # angle
			    @body.a = 0.0
			    
			    @shape = CP::Shape::Circle.new(@body, radius, CP::Vec2.new(0, 0))
			    
			    # elasticy
			    @shape.e = 1
			    # friction coefficient
			    @shape.u = 0.8
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
			    
			    half_width = width / 2.0
			    half_height = height / 2.0
			    shape_verts = [
			                    CP::Vec2.new(-half_width, half_height),
			                    CP::Vec2.new(half_width, half_height),
			                    CP::Vec2.new(half_width, -half_height),
			                    CP::Vec2.new(-half_width, -half_height),
			                   ]

			    @shape = CP::Shape::Poly.new(@body, shape_verts, CP::Vec2.new(0, 0))
			    
			    # elasticy
			    @shape.e = 0.4
			    # friction coefficient
			    @shape.u = 0.8
			end

			def create_polygon vertices				
				# mass & inertia
				@body = CP::Body.new(10, 100)
				# position
			    @body.p = CP::Vec2.new(0, 0)
			    # velocity
			    @body.v = CP::Vec2.new(0, 0)
			    # angle
			    @body.a = 0.0

			    @shape = CP::Shape::Poly.new(@body, vertices, CP::Vec2.new(0, 0))
			    
			    # elasticy
			    @shape.e = 0.4
			    # friction coefficient
			    @shape.u = 0.8
			end
	end
end