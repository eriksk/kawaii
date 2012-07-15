require 'spec_helper'

module Kawaii
	describe TmxTileMap do
		before(:each) do 
			@tile_map = TmxTileMap.new
		end

		it "should contain layers" do
			@tile_map.should respond_to :layers
		end
		it "should contain a width" do
			@tile_map.should respond_to :width
		end
		it "should contain a height" do
			@tile_map.should respond_to :height
		end
		it "should contain a texture" do
			@tile_map.should respond_to :texture
		end
		it "should contain properties" do
			@tile_map.should respond_to :properties
		end
		it "should contain tilesets" do
			@tile_map.should respond_to :tilesets
		end

		describe "#load" do
			it "should be able to load a tmx.json file" do
				@tile_map.load('content/maps/test_map.json')
				@tile_map.width.should == 32
				@tile_map.height.should == 32
				@tile_map.layers.size.should be(1)
			end

			it "should only load json" do
				lambda {@tile_map.load('test/file.yml')}.should raise_error(UnsupportedFormatError) 
			end
		end
	end
end