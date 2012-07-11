require 'spec_helper'

module Kawaii
	describe Game do
		before(:each) do 
			@game = Game.new 800, 600, false, "content", debug = false
		end

		it "should be able to add children" do
			@game.should respond_to :add_child
		end

		it "should be able to remove children" do
			@game.should respond_to :remove_child
		end
	end
end