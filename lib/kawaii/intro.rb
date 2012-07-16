module Kawaii
	class Intro < Scene

		def load
			@logo = Gosu::Image.new(game(), File.dirname(__FILE__) + '/logo.png', false)	
			@rotation = 0
			@position = Vector2.new(game().width / 2, game().height / 2)
			@scale = 1
			@transition_duration = 2000
			@color = Gosu::Color::WHITE
			@color.alpha = 0
		end

		def transition_in current, duration
			fake_duration = 750
			if current <= fake_duration
				@rotation = Kawaii::clerp(0, (360 * 2) - 145, current / (fake_duration * 0.7))
				@scale = Kawaii::clerp(0.1, 1.0, current / (fake_duration * 0.8))
			end
		end

		def transition_out current, duration
			@rotation = Kawaii::clerp(@rotation, 0, (current / duration) * 1.4)
			@scale = Kawaii::clerp(@scale, 0, (current / duration) * 1.4)
			@position.x = Kawaii::clerp(game().width / 2, game().width + 400, (current / duration) * 1.3)
			@position.y += Math::sin(current * 0.01) * 30.0
			@color.alpha = Kawaii::clerp(0, 255, current / duration )
		end

		def update dt
		end

		def before_draw
			@logo.draw_rot(@position.x, @position.y, 0, @rotation, 0.5, 0.5, @scale, 1.0)
		end

		def to_s
			"Intro Scene"
		end
	end
end