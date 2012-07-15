module Kawaii
	class Intro < Scene

		def load
			@logo = Gosu::Image.new(game(), File.dirname(__FILE__) + '/logo.png', false)	
			@rotation = 0
			@position = Vector2.new(game().width / 2, game().height / 2)
			@scale = 1
			@transition_duration = 1800
			@color = Gosu::Color::BLACK
			@color.alpha = 0
		end

		def transition_in current, duration
			fake_duration = 750
			dead_zone = 1200
			if current <= fake_duration
				@rotation = Kawaii::clerp(0, (360 * 2) - 145, current / (fake_duration * 0.7))
				@scale = Kawaii::clerp(0.1, 1.0, current / (fake_duration * 0.8))
			elsif current <= dead_zone
			else
				@rotation += Kawaii::clerp(0, 360, (current - dead_zone) / (duration - dead_zone))
				@position.x = Kawaii::clerp(game().width / 2, game().width + 400, (current - dead_zone) / ((duration - dead_zone) * 1.3))
				@color.alpha = Kawaii::lerp(0, 255, (current - dead_zone) / ((duration - dead_zone)))
			end
		end

		def transition_out current, duration
		end

		def update dt
		end

		def draw
			@logo.draw_rot(@position.x, @position.y, 0, @rotation, 0.5, 0.5, @scale, @scale)
		
			game.draw_quad(
		        0, 0, @color,
		        game.width, 0, @color,
		        game.width, game.height, @color,
		        0, game.height, @color,
		      )
		end
	end
end