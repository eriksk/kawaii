require 'spec_helper'

module Kawaii
	describe Scene do
		before(:each) do
			@scene_manager = SceneManager.new
			@scene = Scene.new @scene_manager
		end
		
		describe "properties" do
			it "should have a name" do
				@scene.should respond_to :name
			end
			it "must have a scene_manager" do
				@scene.should respond_to :scene_manager
				@scene.scene_manager.should_not be(nil)
			end
		end

		describe "#update" do
			it "should respond to update" do
				@scene.should respond_to :update
			end
		end
		describe "#draw" do
			it "should respond to draw" do
				@scene.should respond_to :draw
			end
		end
	end
end