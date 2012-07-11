require 'spec_helper'

module Kawaii
	describe TmxTileMap do
		before(:each) do 
			@map = TmxTileMap.new
			@map.load('/Users/ILab/Documents/ruby/kawaii/spec/kawaii/content/maps/test_map.json')
			@layer = @map.layers.first
		end

		describe "#get_cell" do
			it "should return the cell based on column and row" do
				@layer.data = [0, 4, 6, 1]
				@layer.width = 2
				@layer.height = 2
				@layer.get_cell(1, 0).should == 4
				@layer.get_cell(0, 1).should == 6
			end
		end
	end
end