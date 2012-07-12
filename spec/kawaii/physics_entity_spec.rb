require 'spec_helper'

module Kawaii
	describe PhysicsEntity do
		before(:each) do 
			@circle = PhysicsEntity.new :circle, {:radius => 16}
			@rectangle = PhysicsEntity.new :rectangle, { :width => 32, :height => 64}
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

			end
		end
	end
end