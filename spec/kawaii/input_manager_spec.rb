require 'spec_helper'
require 'gosu'

module Kawaii
	describe InputManager do
		before(:each) do
			@input_manager = InputManager.new(Game.new, [Gosu::KbLeft, Gosu::KbRight])
		end

		describe "properties" do
			it "must have an instance of the game" do
				@input_manager.game.should_not be(nil)
			end
			it "should be able to update states" do
				@input_manager.should respond_to :update
			end
		end

		describe "input states" do
			it "should be able to check if a button is pressed" do
				@input_manager.button_down?(Gosu::KbLeft).should_not be_true
			end

			it "should be able to check if a button is clicked" do
				@input_manager.button_clicked?(Gosu::KbLeft).should_not be_true
			end 
		end
	end
end