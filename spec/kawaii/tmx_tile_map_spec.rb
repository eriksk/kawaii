require 'spec_helper'

module Kawaii
	describe TmxTileMap do
		before(:each) do 
			@tile_map = TmxTileMap.new
		end

		it "should contain a grid" do
			@tile_map.should respond_to :grid
		end
		it "should contain a width" do
			@tile_map.should respond_to :width
		end
		it "should contain a height" do
			@tile_map.should respond_to :height
		end
		it "should contain a cell_size" do
			@tile_map.should respond_to :cell_size
		end
		it "should have a cell_size larger than zero" do
			@tile_map.cell_size.should > 0  
		end

		describe "#get_cell" do
			it "should return the cell based on column and row" do
				@tile_map.grid = [0, 4, 6, 1]
				@tile_map.width = 2
				@tile_map.height = 2
				@tile_map.get_cell(1, 0).should == 4
				@tile_map.get_cell(0, 1).should == 6
			end
		end

		describe "#load" do
			it "should be able to load a tmx xml file" do
				@tile_map.load('path/to/tmx.xml')
				@tile_map.width.should == 32
				@tile_map.height.should == 32
				@tile_map.grid.size.should == 32 * 32
			end
		end
	end
end