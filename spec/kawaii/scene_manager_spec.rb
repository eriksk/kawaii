require 'spec_helper'

module Kawaii
	describe SceneManager do
		before(:each) do
			@scene_manager = SceneManager.new
		end
		
		describe "properties" do
			it "should have one active scene or none" do
				@scene_manager.should respond_to :scene
			end
		end

		describe "#push_scene" do
			it "should be able to push a new scene" do
				scene1 = Scene.new @scene_manager
				scene1.name = "Scene1"
				@scene_manager.push_scene(scene1) 
				@scene_manager.scene.should_not be(nil)
			end

			it "should remove the old scene" do
				scene1 = Scene.new @scene_manager
				scene1.name = "Scene1"
				@scene_manager.push_scene(scene1) 
				scene2 = Scene.new @scene_manager
				scene2.name = "Scene2"
				@scene_manager.push_scene(scene2)
				@scene_manager.scene.name.should == "Scene2"
			end
		end
	end
end