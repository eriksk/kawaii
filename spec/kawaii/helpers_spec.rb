require 'spec_helper'

module Kawaii
	describe "helpers" do
		it "should be able to perform linear interpolation" do
			Kawaii::lerp(0, 100, 0.5).should eq(50)
		end

		it "should be able to perform a cousine interpolation" do
			Kawaii::clerp(0, 100, 0.6).should eq(65.45084971874738)
		end

		it "should be able to perform smooth step interpolation" do
			line = {}
			0..500.times do |i|
				y0 = 0 
				y1 = 500
				y2 = 0 
				y3 = 500
				key = Kawaii::lerp(0, 50, Kawaii::smooth_step(y0, y1, y2, y3, i / 500.0) / 500.0).to_i
				if !line[key]
					line[key] = ""
				end
				line[key] += "-"
			end
			line.each do |k, v|
				puts v
			end
		end
	end
end