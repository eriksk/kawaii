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
	end
end