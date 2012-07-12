require 'spec_helper'

module Kawaii
	describe PhysicsEntity do
		before(:each) do 
			@circle = PhysicsEntity.new :circle, {:radius => 16}
			@rectangle = PhysicsEntity.new :rectangle, { :width => 32, :height => 64}
			@physix = PhysicsManager.new
		end

		describe "properties" do
			it "should have a body" do
				@circle.should respond_to :body
			end
			it "should have a shape" do
				@circle.should respond_to :shape
			end
			it "should have a geom" do
				@circle.should respond_to :geom
			end
			it "should be either a circle or a rectangle" do
				@circle.geom.should be(:circle)
				@rectangle.geom.should be(:rectangle)
			end
		end

		describe "physics integration" do
			it "should be able to add itself to a cp physics space" do
				@circle.add_to_space @physix.space
			end

			it "should be able to remove itself from the cp physics space" do
				@circle.remove_from_space @physix.space
			end
		end
	end
end