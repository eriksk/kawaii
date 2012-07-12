require 'spec_helper'

module Kawaii
	describe Vector2 do
		before(:each) do
			@vector = Vector2.new
		end

		it "should have an x axis" do
			@vector.should respond_to :x
		end

		it "should have a y axis" do
			@vector.should respond_to :y
		end

		describe "helpers" do
			it "should be able to normalize itself" do
				@vector.x = 14.6
				@vector.y = -0.346
				@vector.normalize
				@vector.length.should eq(1.0)
			end	

			it "should be able to calculate its own length" do
				x = -0.531
				y = 1242.412
				@vector.x = x
				@vector.y = y
				@vector.length.should eq(Math::sqrt((x * x) + (y * y)))
			end
		end
	end
end