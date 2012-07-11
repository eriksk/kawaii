require 'spec_helper'

module Kawaii
	describe Entity do
		before(:each) do 
			@entity = Entity.new nil
		end

		it "should not be flipped horizontally default" do
			@entity.flipped_h.should be_false
		end

		it "should not be flipped vertically default" do
			@entity.flipped_v.should be_false
		end

		it "should have an accessable texture" do
			@entity.should respond_to :texture
		end

		describe "#before_update" do
			it "should respond to before_update" do
				@entity.should respond_to :before_update
			end
		end
		describe "#after_update" do
			it "should respond to after_update" do
				@entity.should respond_to :after_update
			end
		end

		describe "#draw" do
			it "should respond to draw" do
				@entity.should respond_to :draw
			end
		end
	end
end