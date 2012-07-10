require 'spec_helper'

module Kawaii
	describe ContentManager do
		before(:each) do
			@img_name = "gfx/ball.png"
			@root = "/Users/ILab/Documents/ruby/kawaii/spec/kawaii/content"
			window = Gosu::Window.new(800, 600, false)
			@content =  ContentManager.new(window, @root)
		end

		it "should set root directory" do
			@content.root.should == @root
		end

		it "should load an image" do
			image = @content.load_image @img_name
			image.should_not be_nil
		end

		it "should cache images loaded multiple times" do
			image = @content.load_image @img_name
			image_copy = @content.load_image @img_name
			image.should == image_copy
		end

		it "should be able to clear cached images" do
			image = @content.load_image @img_name
			@content.clear
			@content.images.size.should == 0
		end
	end
end