module Kawaii
	class InputManager
		
		attr_accessor :game

		def initialize game, bound_buttons = []
			@game = game
			@buttons = []
			@bound_buttons = bound_buttons
		
			@old_mouse_x = 0.0
			@old_mouse_y = 0.0
		end

		def update
			@buttons.clear
			@bound_buttons.each do |btn|
				@buttons.push btn if button_down? btn
			end
			@old_mouse_x = mouse_x
			@old_mouse_y = mouse_y
		end

		def button_down? button
			@game.button_down?(button)	
		end

		def button_clicked? button
			@buttons.include?(button) && !@game.button_down?(button)	
		end

		def mouse_x
			@game.mouse_x
		end
		def mouse_y
			@game.mouse_y
		end
		def old_mouse_x
			@old_mouse_x
		end
		def old_mouse_y
			@old_mouse_y
		end
		def mouse_dif_x
			mouse_x - old_mouse_x
		end
		def mouse_dif_y
			mouse_y - old_mouse_y
		end
	end
end