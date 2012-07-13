require '../../lib/kawaii'

class Enemy < Kawaii::Entity

	def before_update dt
		if @position.y > 600
			@position.y = 600
			@velocity.y *= -1
		end
	end
end