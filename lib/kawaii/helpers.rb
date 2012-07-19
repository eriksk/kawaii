module Kawaii

	def self.lerp min, max, weight
		min + (max - min) * weight
	end

	def self.clerp min, max, weight
		weight2 = (1.0 - Math::cos(weight * Math::PI)) / 2.0
		min * (1.0 - weight2) + max * weight2
	end

	def self.smooth_step y0, y1, y2, y3, mu

		mu2 = mu*mu
		a0 = y3 - y2 - y0 + y1
		a1 = y0 - y1 - a0
		a2 = y2 - y0
		a3 = y1

		(a0*mu*mu2+a1*mu2+a2*mu+a3)
	end
end

# extension helpers
class Numeric 
  def to_radians
    (self - 90) * Math::PI / 180.0
  end
  
  def to_degrees
    self * 180.0 / Math::PI + 90
  end
  
  def to_vector_2
    CP::Vec2.new(Math::cos(self), Math::sin(self))
  end
end