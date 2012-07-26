module Kawaii
	class Scene
		attr_accessor :name, :scene_manager, :transition_duration

		def initialize scene_manager
			@scene_manager = scene_manager
			
			# managers
			@node_manager = Kawaii::NodeManager.new
			@content = Kawaii::ContentManager.new(scene_manager.game, scene_manager.game.content_root)  
			@audio = Kawaii::AudioManager.new(scene_manager.game)
			@input = Kawaii::InputManager.new(scene_manager.game)
			@physics = Kawaii::PhysicsManager.new

			# cam
			@cam = Kawaii::Camera.new(scene_manager.game)

			# set default duration
			@transition_duration = SCENE_TRANSITION_DURATION

			@color = Gosu::Color::WHITE
			@color.alpha = 0

			load()
		end

		def add_child node
			@node_manager.nodes.push node
			if node.respond_to?(:physics)
				@physics.add_physics_entity(node)
			end
		end

		def remove_child node
			@node_manager.nodes.delete node
			if node.respond_to?(:physics)
				@physics.remove_physics_entity(node)
			end
		end

		def load
		end

		def game
			@scene_manager.game
		end

		def transition_in current, duration
		end

		def transition_out current, duration
		end

		def update dt
			@input.update
			before_update()
      @node_manager.update dt
      @physics.update dt
      after_update()
		end

		def before_update
		end
		def after_update
		end
		def before_draw
		end
		def draw_hud
		end
	    def after_draw
	    end

	    def draw
			@cam.translate do 
				before_draw
				@node_manager.draw  
				after_draw
			end
	      
	      	draw_hud

			game.draw_quad(
				0, 0, @color,
				game.width, 0, @color,
				game.width, game.height, @color,
				0, game.height, @color,
			)
	    end
	end
end